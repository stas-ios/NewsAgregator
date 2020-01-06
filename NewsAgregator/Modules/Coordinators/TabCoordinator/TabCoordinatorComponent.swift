//
//  TabCoordinatorComponent.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import UIKit
import Viper

class TabCoordinatorComponent: TabCoordinatorComponentProtocol, ComponentProtocol {
    typealias Output = TabCoordinatorOutputProtocol
    
    //MARK: Dependencies
    @Injected private var __view: TabCoordinatorViewProtocol!
    @Injected private var __presenter: TabCoordinatorPresenterProtocol!
    @Injected private var __interactor: TabCoordinatorInteractorProtocol!
    @Injected private var __router: TabCoordinatorRouterProtocol!
    
    //MARK: ComponentProtocol
    var _view: ViewDependenciesProtocol! { get { __view } }
    var _presenter: PresenterDependenciesProtocol! { get { __presenter } }
    var _interactor: InteractorDependenciesProtocol! { get { __interactor } }
    var _router: RouterDependenciesProtocol! { get { __router } }
    
    //MARK: TabCoordinatorComponentProtocol
    var viewController: UIViewController! { get { __view } }
    var input: TabCoordinatorInputProtocol! { get { __presenter } }
    
    //MARK: Initializable
    required init() {}
}
