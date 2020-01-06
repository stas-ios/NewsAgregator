//
//  SettingsCoordinatorComponent.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class SettingsCoordinatorComponent: SettingsCoordinatorComponentProtocol, ComponentProtocol {
    typealias Output = SettingsCoordinatorOutputProtocol
    
    //MARK: Dependencies
    @Injected private var __view: SettingsCoordinatorViewProtocol!
    @Injected private var __presenter: SettingsCoordinatorPresenterProtocol!
    @Injected private var __interactor: SettingsCoordinatorInteractorProtocol!
    @Injected private var __router: SettingsCoordinatorRouterProtocol!
    
    //MARK: ComponentProtocol
    var _view: ViewDependenciesProtocol! { get { __view } }
    var _presenter: PresenterDependenciesProtocol! { get { __presenter } }
    var _interactor: InteractorDependenciesProtocol! { get { __interactor } }
    var _router: RouterDependenciesProtocol! { get { __router } }
    
    //MARK: SettingsCoordinatorComponentProtocol
    var viewController: UIViewController! { get { __view } }
    var input: SettingsCoordinatorInputProtocol! { get { __presenter } }
    
    //MARK: Initializable
    required init() {}
}
