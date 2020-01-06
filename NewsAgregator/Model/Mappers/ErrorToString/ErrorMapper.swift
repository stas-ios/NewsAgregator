//
//  ErrorMapper.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

class ErrorMapper: Mapper {
    static func map(_ source: Error) -> String {
        switch source {
        case is NetworkError:
            switch source as! NetworkError {
            case .connectionError:
                return "Ошибка связи"
            case .serviceUnavailable:
                return "Сервис временно недоступен"
            case .cancelled:
                return "Операция отменена"
            case .parseError:
                return "Неверный формат данных"
            case .unknown:
                return "Неизвестная ошибка"
            }
        case is DatabaseError:
            return "Ошибка базы данных"
        default:
            return "Неизвестная ошибка"
        }
    }
}
