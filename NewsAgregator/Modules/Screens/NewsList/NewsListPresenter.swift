//
//  NewsListPresenter.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift
import Viper

class NewsListPresenter: BasePresenter<
    NewsListPresenterToViewProtocol,
    NewsListPresenterToInteractorProtocol,
    NewsListPresenterToRouterProtocol,
    NewsListOutputProtocol
>, NewsListPresenterProtocol {
    
    //MARK: Dependencies
    @Injected private var disposeBag: DisposeBag!
    @Injected private var notificationCenter: NotificationCenter!
    
    private var isLoading: Bool = false
    private var reloadTimer: Timer? = nil
    
    //MARK: NewsListInputProtocol
    
    //MARK: NewsListViewToPresenterProtocol
    func didLoad() {
        view.display(navigationTitle: "Новости")
        
        //При закрытии приложения и открытии из фона поведение аналогично уходу с экрана - отключаем таймер при выходе и обновляем список при возвращении
        notificationCenter.rx.notification(
            UIApplication.willEnterForegroundNotification
        ).subscribe(onNext: { [weak self] _ in
            self?.willAppear()
        }).disposed(by: disposeBag)
        
        notificationCenter.rx.notification(
            UIApplication.didEnterBackgroundNotification
        ).subscribe(onNext: { [weak self] _ in
            self?.didDisappear()
        }).disposed(by: disposeBag)
    }
    
    func willAppear() {
        //при возвращении на экран с настроек перезагружаем новости
        readFromDBAndReload()
    }
    
    func didDisappear() {
        //сбрасываем таймер обновления, чтобы не обновлять, пока пользователь на других экранах
        reloadTimer?.invalidate()
        reloadTimer = nil
    }
    
    func didPullToRefresh() {
        //Ручное обновление новостей (pull-to-refresh)
        reloadNews()
    }
    
    //MARK: TableViewToPresenterProtocol
    func didSelectCell(model: CellModelProtocol, indexPath: IndexPath) {
        switch model as! NewsListCells {
        case .newsItem(var item):
            //обработка нажатия на новость
            if !item.hasRead {
                //если не была прочитана ранее, помечаем, как прочитанную и сохраняем пометку в бд
                item.hasRead = true
            }
            
            //помечаем новость как открытую, сохраняем пометки об открытии и прочтении в бд и обновляем ячейку
            item.showDetails = !item.showDetails
            interactor.markIsReading(item)
                .subscribe()
                .disposed(by: disposeBag)
            
            let newCellModel = NewsListCells.newsItem(item)
            view.refresh(cellModel: newCellModel,
                         indexPath: indexPath,
                         animated: true)
            break
        default:
            break
        }
    }
    
    //MARK: Private methods
    private func readFromDBAndReload() {
        isLoading = true
        //При запуске сначала показываем закешированные новости из бд
        interactor.readNews()
            //в случае ошибки бд показываем просто загрузку и загружаем новости с сервера
            .catchErrorJustReturn([])
            .subscribe(
                onSuccess: { [weak self] (newsItems) in
                    //Показываем закешированные новости с индикатором загрузки
                    self?.present(newsItems: newsItems,
                                  showsLoading: (newsItems.count == 0),
                                  error: nil)
                    self?.view.triggerRefreshControl()
                    self?.reloadNews()
            }).disposed(by: disposeBag)
    }
    
    private func reloadNews() {
        isLoading = true
        //Загружаем новости с сервера
        interactor.requestNews()
            .subscribe(
                onSuccess: { [weak self] (newsItems) in
                    self?.didLoadNews(newsItems)
            },
                onError: { [weak self] (error) in
                    self?.didFailLoadingNews(error)
            }
        ).disposed(by: disposeBag)
    }
    
    private func didLoadNews(_ newsItems: [NewsItemData]) {
        //После успешной загрузки новости сохраняем в бд
        interactor.save(newsItems: newsItems)
            .subscribe(
                onSuccess: { [weak self] _ in
                    //читаем новости из бд (уже с пометками о прочтении для старых новостей) и показываем пользователю
                    self?.presentNewsFromDB(error: nil)
            },
                onError: { [weak self] error in
                    //в случае ошибки записи в бд, показываем новости с сервера и уведомляем об ошибке базы данных
                    self?.present(newsItems: newsItems,
                                  showsLoading: false,
                                  error: error)
            })
            .disposed(by: disposeBag)
    }
    
    private func didFailLoadingNews(_ error: Error) {
        //Если новости загрузить не удалось, показываем из базы данных и уведомляем об ошибке сети
        presentNewsFromDB(error: error)
    }
    
    private func presentNewsFromDB(error: Error?) {
        //читаем новости из бд и показываем пользователю
        self.interactor.readNews()
            .subscribe(
                onSuccess: { [weak self] newsItems in
                    self?.present(newsItems: newsItems,
                                  showsLoading: false,
                                  error: error)
            },
                onError: { [weak self] readError in
                    //В случае ошибки убираем индикатор загрузки и уведомляем пользователя об ошибке
                    self?.present(newsItems: [],
                                  showsLoading: false,
                                  error: readError)
            })
        .disposed(by: disposeBag)
    }
    
    private func resetReloadTimer() {
        //Переустанавливает таймер автообновления новостей
        reloadTimer?.invalidate()
        reloadTimer = nil
        
        interactor.readUpdateTimeInterval()
            .subscribe(
                onSuccess: { [weak self] timeInterval in
                    guard let `self` = self else { return }
                    self.reloadTimer = Timer.scheduledTimer(
                        timeInterval: timeInterval,
                        target: self,
                        selector: #selector(self.fireAutoupdateTimer),
                        userInfo: nil,
                        repeats: false)
            }).disposed(by: disposeBag)
    }
    
    @objc private func fireAutoupdateTimer() {
        view.triggerRefreshControl()
        reloadNews()
    }
    
    private func present(newsItems: [NewsItemData],
                         showsLoading: Bool,
                         error: Error?) {
        self.isLoading = false
        self.resetReloadTimer()
        
        var cells = [NewsListCells]()
        
        //Ячейка с ошибкой
        if let error = error {
            cells.append(.error(error))
        }
        
        //Ячейка с текстом о загрузке (при запуске приложения)
        if showsLoading {
            cells.append(.bigText("Пожалуйста, подождите, идёт загрузка"))
        }
        
        if newsItems.count > 0 {
            //Новости
            let newsItemCells: [NewsListCells] = newsItems.map({ .newsItem($0) })
            cells.append(contentsOf: newsItemCells)
        }
        else if !showsLoading {
            cells.append(.bigText("Новостей не найдено. Попробуйте изменить критерии поиска в настройках."))
        }
        
        let tableModel = TableModel(cells: cells)
        view.display(tableModel: tableModel, cellFactory: router)
    }
}
