//
//  TimeIntervalPickerPresenter.swift
//  NewsAgregator
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift
import Viper

class TimeIntervalPickerPresenter: BasePresenter<
    TimeIntervalPickerPresenterToViewProtocol,
    TimeIntervalPickerPresenterToInteractorProtocol,
    TimeIntervalPickerPresenterToRouterProtocol,
    TimeIntervalPickerOutputProtocol
>, TimeIntervalPickerPresenterProtocol {
    //MARK: Dependencies
    @Injected private var disposeBag: DisposeBag!
    
    private var savingToDBSubscription: Disposable?
    
    //MARK: TimeIntervalPickerInputProtocol
    
    //MARK: TimeIntervalPickerViewToPresenterProtocol
    func didLoad() {
        view.display(navigationTitle: "Автообновление")
        
        //читаем из настроек актуальный интервал обновления и показываем все опции
        interactor.readTimeInterval()
            .subscribe(
                onSuccess: { [weak self] selectedTimeInterval in
                    self?.presentTimeIntervals(selected: selectedTimeInterval)
                },
                onError: { [weak self] error in
                    self?.present(error: error)
            }).disposed(by: disposeBag)
    }
    
    //MARK: TableViewToPresenterProtocol
    func didSelectCell(model: CellModelProtocol, indexPath: IndexPath) {
        switch model as! TimeIntervalPickerCells {
        case .checkmarkable(_, let timeInterval):
            //обработка выбора ячейки:
            //обновляем список, чтобы показать галочку у нового значения и убрать у старого
            
            //при быстрых нажатиях didSelectCell может вызваться повторно до того, как предыдущее значение было сохранено в бд, в этом случае переход назад на экран настроек нужно отложить до сохранения последнего значения
            savingToDBSubscription?.dispose()
            savingToDBSubscription = nil
            
            presentTimeIntervals(selected: timeInterval)
            //сохраняем новое значение в базу данных
            saveTimeIntervalToDB(timeInterval: timeInterval)
            break
        default:
            break
        }
    }
    
    //MARK: TimeIntervalPickerRouterToPresenterProtocol
    
    //MARK: Private methods
    private func saveTimeIntervalToDB(timeInterval: UpdateTimeInterval) {
        savingToDBSubscription = interactor.save(timeInterval: timeInterval)
            .subscribe(
                onSuccess: { [weak self] _ in
                    self?.output?.timeIntervalPickerDidSelect(timeInterval: timeInterval)
                    self?.savingToDBSubscription = nil
                },
                onError: { [weak self] error in
                    self?.present(error: error)
                    self?.savingToDBSubscription = nil
            })
        savingToDBSubscription?.disposed(by: disposeBag)
    }
    
    private func presentTimeIntervals(selected: UpdateTimeInterval) {
        let cells: [TimeIntervalPickerCells] = UpdateTimeInterval.allCases
            .map({ cell(timeInterval: $0,
                        isSelected: $0 == selected) })
        
        let tableModel = TableModel(cells: cells)
        view.display(tableModel: tableModel, cellFactory: router)
    }
    
    private func present(error: Error) {
        let tableModel = TableModel(cells: [TimeIntervalPickerCells.error(error)])
        view.display(tableModel: tableModel, cellFactory: router)
    }
    
    private func cell(timeInterval: UpdateTimeInterval, isSelected: Bool) -> TimeIntervalPickerCells {
        return .checkmarkable(CheckmarkableCellData(value: timeInterval.textValue,
                                                    isSelected: isSelected),
                              timeInterval: timeInterval)
    }
}
