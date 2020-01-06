//
//  NewsItemCellAssembly.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Swinject

class NewsItemCellAssembly: NSObject, Assembly {
    func assemble(container: Container) {
        container.register(NewsItemCellViewProtocol.self) { _ in
            let bundle = Bundle(for: NewsItemCellView.self)
            return bundle.loadNibNamed("NewsItemCell", owner: self, options: nil)!.first as! NewsItemCellViewProtocol
        }.inObjectScope(.transient)
        
        container.register(NewsItemCellPresenterProtocol.self) { _ in NewsItemCellPresenter() }
            .inObjectScope(.transient)
            
        container.register(NewsItemCellInteractorProtocol.self) { _ in NewsItemCellInteractor() }
            .inObjectScope(.transient)
        
        container.register(NewsItemCellRouterProtocol.self) { _ in NewsItemCellRouter() }
            .inObjectScope(.transient)
    }
}
