//
//  ModuleFactory.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

///Универсальная фабрика модулей
open class ModuleFactory: ModuleFactoryProtocol {
    ///Сборщик модуля
    private var builder: ModuleBuilderProtocol!
    
    public init(builder: ModuleBuilderProtocol) {
        self.builder = builder
    }
    
    open func component<Component: ComponentProtocol>(ofType type: Component.Type, output: Component.Output) -> Component {
        let component = Component()
        builder.build(component: component,
                      output: output as Component.Output?,
                      moduleFactory: self)
        return component
    }
    
    open func component<Component: ComponentProtocol>(ofType type: Component.Type) -> Component {
        let component = Component()
        builder.build(component: component,
                      output: nil as Component.Output?,
                      moduleFactory: self)
        return component
    }
}
