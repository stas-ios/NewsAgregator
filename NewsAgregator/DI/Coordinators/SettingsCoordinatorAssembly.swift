//
//  SettingsCoordinatorAssembly.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Swinject

class SettingsCoordinatorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SettingsCoordinatorViewProtocol.self) { _ in SettingsCoordinatorView() }
            .inObjectScope(.transient)
        
        container.register(SettingsCoordinatorPresenterProtocol.self) { _ in SettingsCoordinatorPresenter() }
            .inObjectScope(.transient)
            
        container.register(SettingsCoordinatorInteractorProtocol.self) { _ in SettingsCoordinatorInteractor() }
            .inObjectScope(.transient)
        
        container.register(SettingsCoordinatorRouterProtocol.self) { _ in SettingsCoordinatorRouter() }
            .inObjectScope(.transient)
    }
}
