//
//  NewsCoordinatorRouter.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class NewsCoordinatorRouter: BaseRouter<
    NewsCoordinatorRouterToViewProtocol,
    NewsCoordinatorRouterToPresenterProtocol
>, NewsCoordinatorRouterProtocol {
    
    //MARK: Dependencies
    
    //MARK: Child module inputs
    private weak var newsList: NewsListInputProtocol?
    
    //MARK: NewsCoordinatorPresenterToRouterProtocol
    func setScreens(_ screens: [NewsStackElement]) {
        var submodules = [UIViewController]()
        for screen in screens {
            switch screen {
            case .newsList:
                submodules.append(buildNewsList())
                break
            }
        }
        view.setViewControllers(submodules, animated: false)
    }
    
    //MARK: Private methods
    func buildNewsList() -> UIViewController {
        let component: NewsListComponentProtocol = moduleFactory.component(ofType: NewsListComponent.self, output: presenter)
        newsList = component.input
        return component.viewController
    }
}

