//
//  TabCoordinatorRouter.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import UIKit
import Viper

class TabCoordinatorRouter: BaseRouter<
    TabCoordinatorRouterToViewProtocol,
    TabCoordinatorRouterToPresenterProtocol
>, TabCoordinatorRouterProtocol {
    
    //MARK: Dependencies
    
    //MARK: Child module inputs
    private weak var news: NewsCoordinatorInputProtocol?
    private weak var settings: SettingsCoordinatorInputProtocol?
    
    //MARK: TabCoordinatorPresenterToRouterProtocol
    func attachChildCoordinators(_ stacks: [NavigationStack]) {
        var submodules = [UIViewController]()
        for stack in stacks {
            switch stack {
            case .news(let screens):
                submodules.append(buildNewsCoordinator())
                news?.setScreens(screens)
                break
            case .settings(let screens):
                submodules.append(buildSettingsCoordinator())
                settings?.setScreens(screens)
                break
            }
        }
        view.showSubmodules(submodules)
    }
    
    //MARK: Private methods
    private func buildNewsCoordinator() -> UIViewController {
        let component: NewsCoordinatorComponentProtocol = moduleFactory.component(ofType: NewsCoordinatorComponent.self, output: presenter)
        news = component.input
        news!.setup()
        return component.viewController
    }
    
    private func buildSettingsCoordinator() -> UIViewController {
        let component: SettingsCoordinatorComponentProtocol = moduleFactory.component(ofType: SettingsCoordinatorComponent.self, output: presenter)
        settings = component.input
        settings!.setup()
        return component.viewController
    }
}

