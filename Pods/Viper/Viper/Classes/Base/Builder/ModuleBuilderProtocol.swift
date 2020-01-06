//
//  ModuleBuilderProtocol.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

///Протокол сборщика модуля.
public protocol ModuleBuilderProtocol {
    /**
     Устанавливает связи между объектами модуля в соответствии с выбранной архитектурой.
     - parameters:
        - component: Компонента с заранее созданными объектами модуля
        - output: Ссылка на внешний объект-обработчик вывода модуля (обычно presenter родительского модуля)
        - moduleFactory: Фабрика модулей, инжектится в роутер
     */
    func build<Component: ComponentProtocol>(
        component: Component,
        output: Component.Output?,
        moduleFactory: ModuleFactoryProtocol)
}
