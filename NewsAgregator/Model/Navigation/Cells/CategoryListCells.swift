//
//  CategoryListCells.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import Viper

///ячейки на экране списка категорий
enum CategoryListCells: CellModelProtocol {
    ///ячейка категории с галочкой
    case checkmarkable(_ data: CheckmarkableCellData, category: CategoryData)
    
    ///ячейка с ошибкой (ошибка базы данных)
    case error(_ error: Error)
    
    //MARK: CellModelProtocol
    var identifier: String {
        switch self {
        case .checkmarkable: return "CheckmarkableCell"
        case .error: return "ErrorCell"
        }
    }
    
    var data: Any {
        switch self {
        case .checkmarkable(let cellData, _):
            return cellData
        case .error(let error):
            return ErrorMapper.map(error)
        }
    }
}

