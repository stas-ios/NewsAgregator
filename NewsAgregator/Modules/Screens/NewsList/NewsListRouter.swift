//
//  NewsListRouter.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class NewsListRouter: BaseRouter<
    NewsListRouterToViewProtocol,
    NewsListRouterToPresenterProtocol
>, NewsListRouterProtocol {
    
    //MARK: Dependencies
    
    //MARK: Child module inputs
    
    //MARK: NewsListPresenterToRouterProtocol
    
    //MARK: CellFactoryProtocol
    func buildCell(model: CellModelProtocol) -> CellProtocol {
        //Фабрика ячеек для списка новостей
        switch model as! NewsListCells {
        case .newsItem:
            let component: NewsItemCellComponentProtocol = moduleFactory.component(ofType: NewsItemCellComponent.self)
            component.input.setup()
            return component.cell
        case .error:
            return ErrorCell.loadFromNib()
        case .bigText:
            return BigTextCell.loadFromNib()
        }
    }
}

