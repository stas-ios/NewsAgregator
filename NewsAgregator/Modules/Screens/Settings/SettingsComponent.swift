//
//  SettingsComponent.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class SettingsComponent: SettingsComponentProtocol, ComponentProtocol {
    typealias Output = SettingsOutputProtocol
    
    //MARK: Dependencies
    @Injected private var __view: SettingsViewProtocol!
    @Injected private var __presenter: SettingsPresenterProtocol!
    @Injected private var __interactor: SettingsInteractorProtocol!
    @Injected private var __router: SettingsRouterProtocol!
    
    //MARK: ComponentProtocol
    var _view: ViewDependenciesProtocol! { get { __view } }
    var _presenter: PresenterDependenciesProtocol! { get { __presenter } }
    var _interactor: InteractorDependenciesProtocol! { get { __interactor } }
    var _router: RouterDependenciesProtocol! { get { __router } }
    
    //MARK: SettingsComponentProtocol
    var viewController: UIViewController! { get { __view } }
    var input: SettingsInputProtocol! { get { __presenter } }
    
    //MARK: Initializable
    required init() {}
}
