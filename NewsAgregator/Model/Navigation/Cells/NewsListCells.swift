//
//  NewsListCells.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import Viper

///Ячейки экрана новостей
enum NewsListCells: CellModelProtocol {
    ///ячейка с новостью
    case newsItem(_ item: NewsItemData)
    
    ///ячейка с ошибкой (ошибки сети, базы данных)
    case error(_ error: Error)
    
    ///ячейка с текстом о загрузке или отсутствии новостей
    case bigText(_ text: String)
    
    //MARK: CellModelProtocol
    var identifier: String {
        switch self {
        case .newsItem: return "NewsItemCell"
        case .error: return "ErrorCell"
        case .bigText: return "BigTextCell"
        }
    }
    
    var data: Any {
        switch self {
        case .newsItem(let item):
            return item
        case .error(let error):
            return ErrorMapper.map(error)
        case .bigText(let text):
            return text
        }
    }
}
