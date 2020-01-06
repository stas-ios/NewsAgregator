//
//  BaseTableViewController.swift
//  NewsAgregator
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit

///Базовый класс view для TableView-модулей.  Использует TableDataSource и с его помощью реализует методы отображения и обновления модели таблицы
open class BaseTableViewController<ViewToPresenter>: UITableViewController, ViewDependenciesProtocol, TablePresenterToViewProtocol {
    
    public var _presenter: AnyObject!
    public var presenter: ViewToPresenter { _presenter as! ViewToPresenter }
    
    ///Сильная ссылка на dataSource
    internal var strongDataSource: TableDataSource?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    //MARK: TablePresenterToViewProtocol
    open func display(tableModel: TableModel,
                        cellFactory: CellFactoryProtocol) {
        strongDataSource = TableDataSource(model: tableModel,
                                           cellFactory: cellFactory,
                                           presenter: presenter as? TableViewToPresenterProtocol)
        tableView.dataSource = strongDataSource
        tableView.delegate = strongDataSource
        tableView.reloadData()
    }
    
    open func refresh(cellModel: CellModelProtocol, indexPath: IndexPath, animated: Bool) {
        if animated {
            tableView.performBatchUpdates({
                strongDataSource?.model[indexPath] = cellModel
                tableView.reloadRows(at: [indexPath], with: .fade)
            }, completion: nil)
        }
        else {
            strongDataSource?.model[indexPath] = cellModel
            tableView.reloadData()
        }
    }
    
    //MARK: ScreenPresenterToViewProtocol
    open func display(navigationTitle: String) {
        navigationItem.title = navigationTitle
    }
}
