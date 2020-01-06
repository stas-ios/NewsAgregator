//
//  CategoryDBServiceProtocol.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift

///Сервис работы с категориями новостей в базе данных
protocol CategoryDBServiceProtocol {
    ///Получение всех категорий из бд
    func readCategories() -> Single<[CategoryDBDTO]>
    
    ///Сохранение галочки из настроек в бд
    func markSelected(name: String, isSelected: Bool) -> Single<Bool>
}
