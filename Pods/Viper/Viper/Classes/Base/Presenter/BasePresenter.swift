//
//  BasePresenter.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import Foundation

/**
 * Базовый класс презентера. В Generic-параметрах наследника нужно указать конкретные протоколы, по которым он будет обращаться к другим компонентам.
 * Презентер является центральным и самым нагруженным объектом в модуле. Однако дальнейшее его разбиение может ухудшить восприятие кода и привести к ещё большему количеству протоколов
 */
open class BasePresenter<PresenterToView, PresenterToInteractor, PresenterToRouter, ModuleOutput>: PresenterDependenciesProtocol {
    
    public weak var _view: AnyObject!
    public var _interactor: AnyObject!
    public var _router: AnyObject!
    public weak var _output: AnyObject?
    
    public var view: PresenterToView { _view as! PresenterToView }
    public var interactor: PresenterToInteractor { _interactor as! PresenterToInteractor }
    public var router: PresenterToRouter { _router as! PresenterToRouter }
    public var output: ModuleOutput? { _output as! ModuleOutput? }
    
    public init() {
        
    }
}
