//
//  ModuleFactoryProtocol.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

///Фабрика модулей. Используется роутером для добавления дочерних модулей.
public protocol ModuleFactoryProtocol: AnyObject {
    /**
     Создаёт и собирает модуль
     - parameters:
        - type: тип компоненты - уникального для каждого модуля набора конкретных view, presenter, interactor, router
        - output: обработчик вывода модуля (обычно это презентер родительского модуля)
     - returns: возвращает новый модуль с установленными связями
     */
    func component<Component: ComponentProtocol>(ofType type: Component.Type, output: Component.Output) -> Component
    
    /**
     Делает то же, что component(ofType: output:), но для модулей без вывода, т.е. которые ничего не передают родительскому модулю
     - parameters:
        - type: тип компоненты - уникального для каждого модуля набора конкретных view, presenter, interactor, router
     - returns: возвращает новый модуль с установленными связями
     */
    func component<Component: ComponentProtocol>(ofType type: Component.Type) -> Component
}
