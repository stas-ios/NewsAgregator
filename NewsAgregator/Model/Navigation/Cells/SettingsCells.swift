//
//  SettingsCells.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import Viper

///Тэг ячейки в настройках, по которому презентер их различает в didSelectKeyValueCell
enum SettingTag: Int {
    case categories
    case updateTimeInterval
}

///ячейки на экране настроек
enum SettingsCells: CellModelProtocol {
    ///ячейка для настроек категорий и интервала отображения
    case keyValue(_ cellData: KeyValueCellData, tag: SettingTag)
    case error(_ error: Error)
    
    //MARK: CellModelProtocol
    var identifier: String {
        switch self {
        case .keyValue:
            return "KeyValueCell"
        case .error:
            return "ErrorCell"
        }
    }
    
    var data: Any {
        switch self {
        case .keyValue(let cellData, _):
            return cellData
        case .error(let error):
            return ErrorMapper.map(error)
        }
    }
}
