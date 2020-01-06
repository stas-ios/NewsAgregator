//
//  TimeIntervalPickerProtocols.swift
//  NewsAgregator
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import RxSwift
import Viper

//MARK: Public protocols
protocol TimeIntervalPickerInputProtocol: AnyObject {
    
}

protocol TimeIntervalPickerOutputProtocol: AnyObject {
    func timeIntervalPickerDidSelect(timeInterval: UpdateTimeInterval)
}

protocol TimeIntervalPickerComponentProtocol {
    var viewController: UIViewController! { get }
    var input: TimeIntervalPickerInputProtocol! { get }
}

//MARK: Internal protocols
//MARK: View
protocol TimeIntervalPickerPresenterToViewProtocol: TablePresenterToViewProtocol {
    
}

protocol TimeIntervalPickerRouterToViewProtocol {
    
}

protocol TimeIntervalPickerViewProtocol: UIViewController, ViewDependenciesProtocol, TimeIntervalPickerPresenterToViewProtocol, TimeIntervalPickerRouterToViewProtocol {
    
}


//MARK: Presenter
protocol TimeIntervalPickerViewToPresenterProtocol: TableViewToPresenterProtocol {
    func didLoad()
}

protocol TimeIntervalPickerRouterToPresenterProtocol {
    
}

protocol TimeIntervalPickerPresenterProtocol: PresenterDependenciesProtocol, TimeIntervalPickerInputProtocol, TimeIntervalPickerViewToPresenterProtocol, TimeIntervalPickerRouterToPresenterProtocol {
    
}


//MARK: Interactor
protocol TimeIntervalPickerPresenterToInteractorProtocol {
    func save(timeInterval: UpdateTimeInterval) -> Single<Bool>
    func readTimeInterval() -> Single<UpdateTimeInterval>
}

protocol TimeIntervalPickerInteractorProtocol: InteractorDependenciesProtocol, TimeIntervalPickerPresenterToInteractorProtocol {
    
}


//MARK: Router
protocol TimeIntervalPickerPresenterToRouterProtocol: CellFactoryProtocol {
    
}

protocol TimeIntervalPickerRouterProtocol: RouterDependenciesProtocol, TimeIntervalPickerPresenterToRouterProtocol {
    
}
