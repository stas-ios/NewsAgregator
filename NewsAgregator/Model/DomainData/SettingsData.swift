//
//  SettingsData.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

///Период обновления по таймеру на экране новостей (опция в настройках)
enum UpdateTimeInterval: Int, CaseIterable {
    // RawValue записывается в бд и восстанавливается из неё.
    // !!! При добавлении новых опций не менять текущие значения
    case fiveSeconds = 0
    case tenSeconds = 1
    case fifteenSeconds = 2
    case thirtySeconds = 3
    case oneMinute = 4
    case twoMinutes = 5
    case fiveMinutes = 6
    case never = 7
    
    ///период обновления в секундах
    var timeInterval: TimeInterval {
        switch self {
        case .fiveSeconds: return 5.0
        case .tenSeconds: return 10.0
        case .fifteenSeconds: return 15.0
        case .thirtySeconds: return 30.0
        case .oneMinute: return 60.0
        case .twoMinutes: return 120.0
        case .fiveMinutes: return 300.0
        case .never: return .infinity
        }
    }
    
    ///строка для отображения пользователю в настройках
    var textValue: String {
        switch self {
            case .fiveSeconds: return "5 секунд"
            case .tenSeconds: return "10 секунд"
            case .fifteenSeconds: return "15 секунд"
            case .thirtySeconds: return "30 секунд"
            case .oneMinute: return "1 минута"
            case .twoMinutes: return "2 минуты"
            case .fiveMinutes: return "5 минут"
            case .never: return "выкл"
        }
    }
}

///Настройки пользователя
struct SettingsData {
    ///Количество выбранных категорий
    var selectedCategoryCount: Int
    
    ///Количество всех известных категорий
    var totalCategoryCount: Int
    
    ///Период обновления по таймеру на экране новостей (опция в настройках)
    var updateTimeInterval: UpdateTimeInterval
}
