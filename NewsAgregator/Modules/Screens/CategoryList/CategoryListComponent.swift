//
//  CategoryListComponent.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class CategoryListComponent: CategoryListComponentProtocol, ComponentProtocol {
    typealias Output = CategoryListOutputProtocol
    
    //MARK: Dependencies
    @Injected private var __view: CategoryListViewProtocol!
    @Injected private var __presenter: CategoryListPresenterProtocol!
    @Injected private var __interactor: CategoryListInteractorProtocol!
    @Injected private var __router: CategoryListRouterProtocol!
    
    //MARK: ComponentProtocol
    var _view: ViewDependenciesProtocol! { get { __view } }
    var _presenter: PresenterDependenciesProtocol! { get { __presenter } }
    var _interactor: InteractorDependenciesProtocol! { get { __interactor } }
    var _router: RouterDependenciesProtocol! { get { __router } }
    
    //MARK: CategoryListComponentProtocol
    var viewController: UIViewController! { get { __view } }
    var input: CategoryListInputProtocol! { get { __presenter } }
    
    //MARK: Initializable
    required init() {}
}
