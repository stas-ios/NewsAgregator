//
//  SettingsDBServiceProtocol.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift

///Сервис работы с настройками в базе данных
protocol SettingsDBServiceProtocol {
    /**
      Получение объекта настроек из базы данных
     - returns: Observable с настройками. Если в базе настроек нет или произошла ошибка, настройки по умолчанию
     */
    func readSettings() -> Single<SettingsDBDTO>
    
    ///Сохранение интервала автообновления в бд
    func save(timeIntervalOption: Int) -> Single<Bool>
}
