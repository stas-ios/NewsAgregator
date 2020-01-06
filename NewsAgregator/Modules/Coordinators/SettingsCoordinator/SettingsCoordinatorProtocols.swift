//
//  SettingsCoordinatorProtocols.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

//MARK: Public protocols
protocol SettingsCoordinatorInputProtocol: AnyObject {
    func setup()
    func setScreens(_ screens: [SettingsStackElement])
}

protocol SettingsCoordinatorOutputProtocol: AnyObject {
    
}

protocol SettingsCoordinatorComponentProtocol {
    var viewController: UIViewController! { get }
    var input: SettingsCoordinatorInputProtocol! { get }
}

//MARK: Internal protocols
//MARK: View
protocol SettingsCoordinatorPresenterToViewProtocol: NavigationPresenterToViewProtocol {
    
}

protocol SettingsCoordinatorRouterToViewProtocol: NavigationRouterToViewProtocol {
    
}

protocol SettingsCoordinatorViewProtocol: UIViewController, ViewDependenciesProtocol, SettingsCoordinatorPresenterToViewProtocol, SettingsCoordinatorRouterToViewProtocol {
    
}


//MARK: Presenter
protocol SettingsCoordinatorViewToPresenterProtocol {
    
}

protocol SettingsCoordinatorRouterToPresenterProtocol: SettingsOutputProtocol, CategoryListOutputProtocol, TimeIntervalPickerOutputProtocol {

}

protocol SettingsCoordinatorPresenterProtocol: PresenterDependenciesProtocol, SettingsCoordinatorInputProtocol, SettingsCoordinatorViewToPresenterProtocol, SettingsCoordinatorRouterToPresenterProtocol {
    
}


//MARK: Interactor
protocol SettingsCoordinatorPresenterToInteractorProtocol {
    
}

protocol SettingsCoordinatorInteractorProtocol: InteractorDependenciesProtocol, SettingsCoordinatorPresenterToInteractorProtocol {
    
}


//MARK: Router
protocol SettingsCoordinatorPresenterToRouterProtocol {
    func setScreens(_ screens: [SettingsStackElement])
    func push(_ screen: SettingsStackElement)
    func popTimeIntervalPicker()
}

protocol SettingsCoordinatorRouterProtocol: RouterDependenciesProtocol, SettingsCoordinatorPresenterToRouterProtocol {
    
}
