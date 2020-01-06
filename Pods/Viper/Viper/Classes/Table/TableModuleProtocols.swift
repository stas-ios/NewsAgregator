//
//  TableModuleProtocols.swift
//  NewsAgregator
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

public protocol TablePresenterToViewProtocol: ScreenPresenterToViewProtocol {
    func display(tableModel: TableModel, cellFactory: CellFactoryProtocol)
    func refresh(cellModel: CellModelProtocol, indexPath: IndexPath, animated: Bool)
}

public protocol TableViewToPresenterProtocol: AnyObject {
    func didSelectCell(model: CellModelProtocol, indexPath: IndexPath)
}
