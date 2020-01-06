//
//  BaseRouter.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import Foundation

/**
 * Базовый класс роутера. В Generic-параметрах наследника нужно указать конкретные протоколы, по которым он будет обращаться к другим компонентам.
 *
 * В отличие от классического VIPER, навигация вынесена в полноценные модули-координаторы.
 * В этой модификации роутер отвечает только за добавление и взаимодействие с дочерними модулями:
 * - вызывает методы Builder-ов для создания дочерних модулей
 * - передаёт данные дочерним модулям (ChildModuleInputProtocol)
 * В родительский модуль данные передаются из презентера напрямую через output.
 */
open class BaseRouter<RouterToView, RouterToPresenter>: RouterDependenciesProtocol {
    public weak var _view: AnyObject!
    public weak var _presenter: AnyObject!
    public var _moduleFactory: AnyObject!
    
    ///Роутер обращается к view для добавления созданных модулей во view-иерархию
    public var view: RouterToView { _view as! RouterToView }
    
    ///Роутер подключает презентер к дочерним модулям в качестве output
    public var presenter: RouterToPresenter { _presenter as! RouterToPresenter }
    
    ///Фабрика Viper-модулей, используемая для создания дочерних модулей
    public var moduleFactory: ModuleFactoryProtocol! { (_moduleFactory as! ModuleFactoryProtocol) }
    
    public init() {
        
    }
}
