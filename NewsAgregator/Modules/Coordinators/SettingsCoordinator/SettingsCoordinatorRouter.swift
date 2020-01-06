//
//  SettingsCoordinatorRouter.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class SettingsCoordinatorRouter: BaseRouter<
    SettingsCoordinatorRouterToViewProtocol,
    SettingsCoordinatorRouterToPresenterProtocol
>, SettingsCoordinatorRouterProtocol {
    
    //MARK: Dependencies
    
    //MARK: Child module inputs
    private weak var settings: SettingsInputProtocol?
    private weak var categoryList: CategoryListInputProtocol?
    private weak var timeIntervalPicker: TimeIntervalPickerInputProtocol?
    
    //MARK: SettingsCoordinatorPresenterToRouterProtocol
    func setScreens(_ screens: [SettingsStackElement]) {
        var submodules = [UIViewController]()
        for screen in screens {
            let module = build(screen: screen)
            submodules.append(module)
        }
        view.setViewControllers(submodules, animated: false)
    }
    
    func push(_ screen: SettingsStackElement) {
        let module = build(screen: screen)
        view.pushViewController(module, animated: true)
    }
    
    func popTimeIntervalPicker() {
        if timeIntervalPicker != nil {
            view.popViewController(animated: true)
        }
    }
    
    //MARK: Private methods
    private func build(screen: SettingsStackElement) -> UIViewController {
        switch screen {
        case .settings:
            return buildSettings()
        case .categoryList:
            return buildCategoryList()
        case .timeIntervalPicker:
            return buildTimeIntervalPicker()
        }
    }
    
    private func buildSettings() -> UIViewController {
        let component: SettingsComponentProtocol = moduleFactory.component(ofType: SettingsComponent.self, output: presenter)
        settings = component.input
        return component.viewController
    }
    
    private func buildCategoryList() -> UIViewController {
        let component: CategoryListComponentProtocol = moduleFactory.component(ofType: CategoryListComponent.self, output: presenter)
        categoryList = component.input
        return component.viewController
    }
    
    private func buildTimeIntervalPicker() -> UIViewController {
        let component: TimeIntervalPickerComponentProtocol = moduleFactory.component(ofType: TimeIntervalPickerComponent.self, output: presenter)
        timeIntervalPicker = component.input
        return component.viewController
    }
}

