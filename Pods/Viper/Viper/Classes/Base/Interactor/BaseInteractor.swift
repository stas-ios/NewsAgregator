//
//  BaseInteractor.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import Foundation

/**
 * Базовый класс интерактора.
 */
open class BaseInteractor: InteractorDependenciesProtocol {
    //В данной модификации VIPER-а интерактор обращается только к сервисам.
    //Данные в презентер передаются синхронно в ответе метода или асинхронно через rx
    public init() {
        
    }
}
