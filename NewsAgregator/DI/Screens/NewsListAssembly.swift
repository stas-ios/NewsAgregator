//
//  NewsListAssembly.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Swinject

class NewsListAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NewsListViewProtocol.self) { _ in
            let bundle = Bundle(for: NewsListView.self)
            let storyboard = UIStoryboard(name: "NewsList", bundle: bundle)
            return storyboard.instantiateInitialViewController() as! NewsListViewProtocol
        }.inObjectScope(.transient)
        
        container.register(NewsListPresenterProtocol.self) { _ in NewsListPresenter() }
            .inObjectScope(.transient)
            
        container.register(NewsListInteractorProtocol.self) { _ in NewsListInteractor() }
            .inObjectScope(.transient)
        
        container.register(NewsListRouterProtocol.self) { _ in NewsListRouter() }
            .inObjectScope(.transient)
    }
}
