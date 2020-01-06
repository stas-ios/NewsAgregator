//
//  NewsListView.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Viper

class NewsListView: BaseTableViewController<
    NewsListViewToPresenterProtocol
>, NewsListViewProtocol {
    //MARK: Dependencies
    @Injected private var disposeBag: DisposeBag!
    
    //MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.didDisappear()
    }
    
    //MARK: NewsListPresenterToViewProtocol
    
    override func display(tableModel: TableModel, cellFactory: CellFactoryProtocol) {
        super.display(tableModel: tableModel, cellFactory: cellFactory)
        
        //При обновлении новостей прокручиваем к верхней части списка
        if tableModel.existsCell(indexPath: IndexPath(row: 0, section: 0)) {
            tableView.scrollToRow(at: IndexPath(row: 0, section: 0),
                                  at: .top,
                                  animated: true)
        }
        
        if let refreshControl = refreshControl,
            refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
    
    func triggerRefreshControl() {
        //показ индикатора загрузки вызовом из презентера
        guard let refreshControl = refreshControl else { return }
        refreshControl.beginRefreshing()
        tableView.setContentOffset(CGPoint(x: 0.0, y: -tableView.adjustedContentInset.top),
                                   animated: false)
    }
    
    //MARK: NewsListRouterToViewProtocol
    
    //MARK: Private methods
    private func setup() {
        //создание RefreshControl-а
        refreshControl = UIRefreshControl()
        refreshControl!.rx.controlEvent(.valueChanged)
            .subscribe(onNext: { [weak self] in
                self?.presenter.didPullToRefresh()
        }).disposed(by: disposeBag)
        
        tableView.addSubview(refreshControl!)
    }
}
