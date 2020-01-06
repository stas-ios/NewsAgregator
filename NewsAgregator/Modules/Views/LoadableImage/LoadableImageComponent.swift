//
//  LoadableImageComponent.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class LoadableImageComponent: LoadableImageComponentProtocol, ComponentProtocol {
    typealias Output = LoadableImageOutputProtocol
    
    //MARK: Dependencies
    @Injected private var __view: LoadableImageViewProtocol!
    @Injected private var __presenter: LoadableImagePresenterProtocol!
    @Injected private var __interactor: LoadableImageInteractorProtocol!
    @Injected private var __router: LoadableImageRouterProtocol!
    
    //MARK: ComponentProtocol
    var _view: ViewDependenciesProtocol! { get { __view } }
    var _presenter: PresenterDependenciesProtocol! { get { __presenter } }
    var _interactor: InteractorDependenciesProtocol! { get { __interactor } }
    var _router: RouterDependenciesProtocol! { get { __router } }
    
    //MARK: LoadableImageComponentProtocol
    var view: UIView! { get { __view } }
    var input: LoadableImageInputProtocol! { get { __presenter } }
    
    //MARK: Initializable
    required init() {}
}
