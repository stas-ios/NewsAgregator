//
//  SettingsProtocols.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper
import RxSwift

//MARK: Public protocols
protocol SettingsInputProtocol: AnyObject {
    
}

protocol SettingsOutputProtocol: AnyObject {
    func didSelectCategoriesCellOnSettingsScreen()
    func didSelectTimeIntervalCellOnSettingsScreen()
}

protocol SettingsComponentProtocol {
    var viewController: UIViewController! { get }
    var input: SettingsInputProtocol! { get }
}

//MARK: Internal protocols
//MARK: View
protocol SettingsPresenterToViewProtocol: TablePresenterToViewProtocol {
    func display(navigationTitle: String)
}

protocol SettingsRouterToViewProtocol {
    
}

protocol SettingsViewProtocol: UIViewController, ViewDependenciesProtocol, SettingsPresenterToViewProtocol, SettingsRouterToViewProtocol {
    
}


//MARK: Presenter
protocol SettingsViewToPresenterProtocol: TableViewToPresenterProtocol {
    func didLoad()
    func willAppear()
}

protocol SettingsRouterToPresenterProtocol {
    
}

protocol SettingsPresenterProtocol: PresenterDependenciesProtocol, SettingsInputProtocol, SettingsViewToPresenterProtocol, SettingsRouterToPresenterProtocol {
    
}


//MARK: Interactor
protocol SettingsPresenterToInteractorProtocol {
    func readSettings() -> Single<SettingsData>
}

protocol SettingsInteractorProtocol: InteractorDependenciesProtocol, SettingsPresenterToInteractorProtocol {
    
}


//MARK: Router
protocol SettingsPresenterToRouterProtocol: CellFactoryProtocol {
    
}

protocol SettingsRouterProtocol: RouterDependenciesProtocol, SettingsPresenterToRouterProtocol {
    
}
