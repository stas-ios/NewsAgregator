//
//  DependenciesProtocols.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import Foundation

/*
 Протоколы связей в VIPER-модуле, используются ModuleBuilder-ом для установления связей между объектами.
 ModuleBuilder-у не важно, что именно делают объекты - он только устанавливает связи, поэтому здесь все property AnyObject
 */

public protocol ViewDependenciesProtocol: AnyObject {
    var _presenter: AnyObject! { get set }
}

public protocol PresenterDependenciesProtocol: AnyObject {
    var _view: AnyObject! { get set }
    var _interactor: AnyObject! { get set }
    var _router: AnyObject! { get set }
    var _output: AnyObject? { get set }
}

public protocol InteractorDependenciesProtocol: AnyObject {
    
}

public protocol RouterDependenciesProtocol: AnyObject {
    var _view: AnyObject! { get set }
    var _presenter: AnyObject! { get set }
    ///Ссылка роутера на ModuleFactory. ModuleFactory у всех модулей одинаковая, здесь добавлена скорее для удобства
    var _moduleFactory: AnyObject! { get set }
}

//MARK: Component

///Протокол компоненты, определяющей VIPER-модуль.
public protocol ComponentProtocol {
    ///Протокол вывода VIPER-модуля.
    associatedtype Output
    
    var _view: ViewDependenciesProtocol! { get }
    var _presenter: PresenterDependenciesProtocol! { get }
    var _interactor: InteractorDependenciesProtocol! { get }
    var _router: RouterDependenciesProtocol! { get }

    /**
     Метод инициализации компоненты. Используется в ModuleFactory.
     После инициализации компоненты все составляющие должны быть созданы и билдеру остаётся только их связать.
    */
    init()
}
