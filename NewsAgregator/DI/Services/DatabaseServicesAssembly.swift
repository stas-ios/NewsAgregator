//
//  DatabaseServicesAssembly.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Swinject

class DatabaseServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DatabaseServiceProtocol.self) { _ in DatabaseService() }.inObjectScope(.container)
        
        container.register(NewsDBServiceProtocol.self) { _ in NewsDBService() }.inObjectScope(.weak)
        container.register(CategoryDBServiceProtocol.self) { _ in CategoryDBService() }.inObjectScope(.weak)
        container.register(SettingsDBServiceProtocol.self) { _ in SettingsDBService() }.inObjectScope(.weak)
    }
}
