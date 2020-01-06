//
//  NewsDBServiceProtocol.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift

///Сервис работы с новостями в базе данных
protocol NewsDBServiceProtocol {
    ///Получение всех новостей из бд
    func readNewsItems() -> Single<[NewsItemDBDTO]>
    
    ///Сохранение списка новостей в бд.
    func save(_ news: [NewsItemDBDTO]) -> Single<Bool>
    
    ///Сохранение пометок о прочтении новости в бд
    func markIsReading(guid: String, flag: Bool) -> Single<Bool>
}
