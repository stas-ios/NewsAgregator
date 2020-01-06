//
//  NewsListComponent.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class NewsListComponent: NewsListComponentProtocol, ComponentProtocol {
    typealias Output = NewsListOutputProtocol
    
    //MARK: Dependencies
    @Injected private var __view: NewsListViewProtocol!
    @Injected private var __presenter: NewsListPresenterProtocol!
    @Injected private var __interactor: NewsListInteractorProtocol!
    @Injected private var __router: NewsListRouterProtocol!
    
    //MARK: ComponentProtocol
    var _view: ViewDependenciesProtocol! { get { __view } }
    var _presenter: PresenterDependenciesProtocol! { get { __presenter } }
    var _interactor: InteractorDependenciesProtocol! { get { __interactor } }
    var _router: RouterDependenciesProtocol! { get { __router } }
    
    //MARK: NewsListComponentProtocol
    var viewController: UIViewController! { get { __view } }
    var input: NewsListInputProtocol! { get { __presenter } }
    
    //MARK: Initializable
    required init() {}
}
