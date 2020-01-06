//
//  NewsCoordinatorProtocols.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

//MARK: Public protocols
protocol NewsCoordinatorInputProtocol: AnyObject {
    func setup()
    func setScreens(_ screens: [NewsStackElement])
}

protocol NewsCoordinatorOutputProtocol: AnyObject {
    
}

protocol NewsCoordinatorComponentProtocol {
    var viewController: UIViewController! { get }
    var input: NewsCoordinatorInputProtocol! { get }
}

//MARK: Internal protocols
//MARK: View
protocol NewsCoordinatorPresenterToViewProtocol: NavigationPresenterToViewProtocol {
    
}

protocol NewsCoordinatorRouterToViewProtocol: NavigationRouterToViewProtocol {
    
}

protocol NewsCoordinatorViewProtocol: UIViewController, ViewDependenciesProtocol, NewsCoordinatorPresenterToViewProtocol, NewsCoordinatorRouterToViewProtocol {
    
}


//MARK: Presenter
protocol NewsCoordinatorViewToPresenterProtocol {
    
}

protocol NewsCoordinatorRouterToPresenterProtocol: NewsListOutputProtocol {
    
}

protocol NewsCoordinatorPresenterProtocol: PresenterDependenciesProtocol, NewsCoordinatorInputProtocol, NewsCoordinatorViewToPresenterProtocol, NewsCoordinatorRouterToPresenterProtocol {
    
}


//MARK: Interactor
protocol NewsCoordinatorPresenterToInteractorProtocol {
    
}

protocol NewsCoordinatorInteractorProtocol: InteractorDependenciesProtocol, NewsCoordinatorPresenterToInteractorProtocol {
    
}


//MARK: Router
protocol NewsCoordinatorPresenterToRouterProtocol {
    func setScreens(_ screens: [NewsStackElement])
}

protocol NewsCoordinatorRouterProtocol: RouterDependenciesProtocol, NewsCoordinatorPresenterToRouterProtocol {
    
}
