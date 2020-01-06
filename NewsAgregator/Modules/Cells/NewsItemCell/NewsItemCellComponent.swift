//
//  NewsItemCellComponent.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class NewsItemCellComponent: NewsItemCellComponentProtocol, ComponentProtocol {
    typealias Output = NewsItemCellOutputProtocol
    
    //MARK: Dependencies
    @Injected private var __view: NewsItemCellViewProtocol!
    @Injected private var __presenter: NewsItemCellPresenterProtocol!
    @Injected private var __interactor: NewsItemCellInteractorProtocol!
    @Injected private var __router: NewsItemCellRouterProtocol!
    
    //MARK: ComponentProtocol
    var _view: ViewDependenciesProtocol! { get { __view } }
    var _presenter: PresenterDependenciesProtocol! { get { __presenter } }
    var _interactor: InteractorDependenciesProtocol! { get { __interactor } }
    var _router: RouterDependenciesProtocol! { get { __router } }
    
    //MARK: NewsItemCellComponentProtocol
    var cell: CellProtocol! { get { __view } }
    var input: NewsItemCellInputProtocol! { get { __presenter } }
    
    //MARK: Initializable
    required init() {}
}
