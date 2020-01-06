//
//  LoadableImageAssembly.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Swinject

class LoadableImageAssembly: NSObject, Assembly {
    func assemble(container: Container) {
        container.register(LoadableImageViewProtocol.self) { _ in
            let bundle = Bundle(for: LoadableImageView.self)
            return bundle.loadNibNamed("LoadableImage", owner: self, options: nil)!.first as! LoadableImageViewProtocol
        }.inObjectScope(.transient)
        
        container.register(LoadableImagePresenterProtocol.self) { _ in LoadableImagePresenter() }
            .inObjectScope(.transient)
            
        container.register(LoadableImageInteractorProtocol.self) { _ in LoadableImageInteractor() }
            .inObjectScope(.transient)
        
        container.register(LoadableImageRouterProtocol.self) { _ in LoadableImageRouter() }
            .inObjectScope(.transient)
    }
}
