//
//  CategoryListAssembly.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Swinject

class CategoryListAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CategoryListViewProtocol.self) { _ in
            let bundle = Bundle(for: CategoryListView.self)
            let storyboard = UIStoryboard(name: "CategoryList", bundle: bundle)
            return storyboard.instantiateInitialViewController() as! CategoryListViewProtocol
        }.inObjectScope(.transient)
        
        container.register(CategoryListPresenterProtocol.self) { _ in CategoryListPresenter() }
            .inObjectScope(.transient)
            
        container.register(CategoryListInteractorProtocol.self) { _ in CategoryListInteractor() }
            .inObjectScope(.transient)
        
        container.register(CategoryListRouterProtocol.self) { _ in CategoryListRouter() }
            .inObjectScope(.transient)
    }
}
