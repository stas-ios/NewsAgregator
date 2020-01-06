//
//  SettingsAssembly.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Swinject

class SettingsAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SettingsViewProtocol.self) { _ in
            let bundle = Bundle(for: SettingsView.self)
            let storyboard = UIStoryboard(name: "Settings", bundle: bundle)
            return storyboard.instantiateInitialViewController() as! SettingsViewProtocol
        }.inObjectScope(.transient)
        
        container.register(SettingsPresenterProtocol.self) { _ in SettingsPresenter() }
            .inObjectScope(.transient)
            
        container.register(SettingsInteractorProtocol.self) { _ in SettingsInteractor() }
            .inObjectScope(.transient)
        
        container.register(SettingsRouterProtocol.self) { _ in SettingsRouter() }
            .inObjectScope(.transient)
    }
}
