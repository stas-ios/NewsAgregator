//
//  TabCoordinatorProtocols.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import UIKit
import Viper

/*
 * Корневой модуль приложения. Построен вокруг TabBarController-а.
 */

//MARK: Public protocols
protocol TabCoordinatorInputProtocol: AnyObject {
    func setup()
}

protocol TabCoordinatorOutputProtocol: AnyObject {
    
}

protocol TabCoordinatorComponentProtocol {
    var viewController: UIViewController! { get }
    var input: TabCoordinatorInputProtocol! { get }
}

//MARK: Internal protocols
//MARK: View
protocol TabCoordinatorPresenterToViewProtocol {
    
}

protocol TabCoordinatorRouterToViewProtocol {
    func showSubmodules(_ submodules: [UIViewController])
}

protocol TabCoordinatorViewProtocol: UIViewController, ViewDependenciesProtocol, TabCoordinatorPresenterToViewProtocol, TabCoordinatorRouterToViewProtocol {
    
}


//MARK: Presenter
protocol TabCoordinatorViewToPresenterProtocol {
    
}

protocol TabCoordinatorRouterToPresenterProtocol: NewsCoordinatorOutputProtocol, SettingsCoordinatorOutputProtocol {
    
}

protocol TabCoordinatorPresenterProtocol: PresenterDependenciesProtocol, TabCoordinatorInputProtocol, TabCoordinatorViewToPresenterProtocol, TabCoordinatorRouterToPresenterProtocol {
    
}


//MARK: Interactor
protocol TabCoordinatorPresenterToInteractorProtocol {
    
}

protocol TabCoordinatorInteractorProtocol: InteractorDependenciesProtocol, TabCoordinatorPresenterToInteractorProtocol {
    
}


//MARK: Router
protocol TabCoordinatorPresenterToRouterProtocol {
    func attachChildCoordinators(_ stacks: [NavigationStack])
}

protocol TabCoordinatorRouterProtocol: RouterDependenciesProtocol, TabCoordinatorPresenterToRouterProtocol {
    
}
