//
//  CategoryListRouter.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class CategoryListRouter: BaseRouter<
    CategoryListRouterToViewProtocol,
    CategoryListRouterToPresenterProtocol
>, CategoryListRouterProtocol {
    
    //MARK: Dependencies
    
    //MARK: Child module inputs
    
    //MARK: CategoryListPresenterToRouterProtocol
    
    //MARK: CellFactoryProtocol
    func buildCell(model: CellModelProtocol) -> CellProtocol {
        switch model as! CategoryListCells {
        case .checkmarkable:
            return CheckmarkableCell.loadFromNib()
        case .error:
            return ErrorCell.loadFromNib()
        }
    }
    
}

