//
//  TabCoordinatorAssembly.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import Swinject

class TabCoordinatorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TabCoordinatorViewProtocol.self) { _ in TabCoordinatorView() }
            .inObjectScope(.transient)
        
        container.register(TabCoordinatorPresenterProtocol.self) { _ in TabCoordinatorPresenter() }
            .inObjectScope(.transient)
            
        container.register(TabCoordinatorInteractorProtocol.self) { _ in TabCoordinatorInteractor() }
            .inObjectScope(.transient)
        
        container.register(TabCoordinatorRouterProtocol.self) { _ in TabCoordinatorRouter() }
            .inObjectScope(.transient)
    }
}
