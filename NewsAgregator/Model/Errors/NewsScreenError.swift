//
//  NewsScreenError.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

///Ошибки на экране новостей
enum NewsScreenError: Error {
    case noNews //оба источника вернули успешный, но пустой ответ, невероятный кейс, не стал его обрабатывать
    case unknown
}
