//
//  TimeIntervalPickerComponent.swift
//  NewsAgregator
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class TimeIntervalPickerComponent: TimeIntervalPickerComponentProtocol, ComponentProtocol {
    typealias Output = TimeIntervalPickerOutputProtocol
    
    //MARK: Dependencies
    @Injected private var __view: TimeIntervalPickerViewProtocol!
    @Injected private var __presenter: TimeIntervalPickerPresenterProtocol!
    @Injected private var __interactor: TimeIntervalPickerInteractorProtocol!
    @Injected private var __router: TimeIntervalPickerRouterProtocol!
    
    //MARK: ComponentProtocol
    var _view: ViewDependenciesProtocol! { get { __view } }
    var _presenter: PresenterDependenciesProtocol! { get { __presenter } }
    var _interactor: InteractorDependenciesProtocol! { get { __interactor } }
    var _router: RouterDependenciesProtocol! { get { __router } }
    
    //MARK: TimeIntervalPickerComponentProtocol
    var viewController: UIViewController! { get { __view } }
    var input: TimeIntervalPickerInputProtocol! { get { __presenter } }
    
    //MARK: Initializable
    required init() {}
}
