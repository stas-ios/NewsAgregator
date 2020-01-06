//
//  NewsCoordinatorAssembly.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Swinject

class NewsCoordinatorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NewsCoordinatorViewProtocol.self) { _ in NewsCoordinatorView() }
            .inObjectScope(.transient)
        
        container.register(NewsCoordinatorPresenterProtocol.self) { _ in NewsCoordinatorPresenter() }
            .inObjectScope(.transient)
            
        container.register(NewsCoordinatorInteractorProtocol.self) { _ in NewsCoordinatorInteractor() }
            .inObjectScope(.transient)
        
        container.register(NewsCoordinatorRouterProtocol.self) { _ in NewsCoordinatorRouter() }
            .inObjectScope(.transient)
    }
}
