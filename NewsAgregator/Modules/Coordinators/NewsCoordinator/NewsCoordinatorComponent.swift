//
//  NewsCoordinatorComponent.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class NewsCoordinatorComponent: NewsCoordinatorComponentProtocol, ComponentProtocol {
    typealias Output = NewsCoordinatorOutputProtocol
    
    //MARK: Dependencies
    @Injected private var __view: NewsCoordinatorViewProtocol!
    @Injected private var __presenter: NewsCoordinatorPresenterProtocol!
    @Injected private var __interactor: NewsCoordinatorInteractorProtocol!
    @Injected private var __router: NewsCoordinatorRouterProtocol!
    
    //MARK: ComponentProtocol
    var _view: ViewDependenciesProtocol! { get { __view } }
    var _presenter: PresenterDependenciesProtocol! { get { __presenter } }
    var _interactor: InteractorDependenciesProtocol! { get { __interactor } }
    var _router: RouterDependenciesProtocol! { get { __router } }
    
    //MARK: NewsCoordinatorComponentProtocol
    var viewController: UIViewController! { get { __view } }
    var input: NewsCoordinatorInputProtocol! { get { __presenter } }
    
    //MARK: Initializable
    required init() {}
}
