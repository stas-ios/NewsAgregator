//
//  ModuleBuilder.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import Foundation

///Универсальный сборщик VIPER-модуля.
open class ModuleBuilder: ModuleBuilderProtocol {
    public init() {
        
    }
    
    open func build<Component: ComponentProtocol>(
        component: Component,
        output: Component.Output?,
        moduleFactory: ModuleFactoryProtocol) {
        
        component._view._presenter = component._presenter
        component._presenter._view = component._view
        component._presenter._interactor = component._interactor
        component._presenter._router = component._router
        component._presenter._output = output as AnyObject?
        component._router._view = component._view
        component._router._presenter = component._presenter
        component._router._moduleFactory = moduleFactory
    }
}
