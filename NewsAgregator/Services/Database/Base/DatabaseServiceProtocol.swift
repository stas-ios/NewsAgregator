//
//  DatabaseServiceProtocol.swift
//  NewsAgregator
//
//  Created by Work on 03/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

///Протокол для работы с базой данных
protocol DatabaseServiceProtocol {
    ///Инициализация базы данных при запуске мп. В будущих версиях здесь будут выполняться миграции.
    func setup()
    
    ///Асинхронное чтение одного объекта
    func object<T: Object, KeyType>(primaryKey: KeyType) -> Single<T?>
    
    ///Асинхронное чтение всех объектов одного типа
    func objects<T: Object>() -> Single<[T]>
    
    ///Асинхронная запись в базу данных. Все записываемые объекты должны читаться из бд или создаваться в этом блоке.
    func write(_ block: @escaping ((RealmProtocol) throws -> Void)) -> Single<Bool>
}
