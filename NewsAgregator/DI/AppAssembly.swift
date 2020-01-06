//
//  AppAssembly.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import Swinject
import Viper

class AppAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppLauncherProtocol.self) { _ in AppLauncher() }
            .inObjectScope(.graph)
        container.register(ModuleFactoryProtocol.self) { r in
            let builder = r.resolve(ModuleBuilderProtocol.self)!
            return ModuleFactory(builder: builder)
        }.inObjectScope(.weak)
        container.register(ModuleBuilderProtocol.self) { _ in ModuleBuilder() }
            .inObjectScope(.weak)
    }
}
