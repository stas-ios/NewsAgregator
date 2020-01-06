//
//  CategoryListProtocols.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import RxSwift
import Viper

//MARK: Public protocols
protocol CategoryListInputProtocol: AnyObject {
    
}

protocol CategoryListOutputProtocol: AnyObject {
    
}

protocol CategoryListComponentProtocol {
    var viewController: UIViewController! { get }
    var input: CategoryListInputProtocol! { get }
}

//MARK: Internal protocols
//MARK: View
protocol CategoryListPresenterToViewProtocol: TablePresenterToViewProtocol {
    func display(navigationTitle: String)
}

protocol CategoryListRouterToViewProtocol {
    
}

protocol CategoryListViewProtocol: UIViewController, ViewDependenciesProtocol, CategoryListPresenterToViewProtocol, CategoryListRouterToViewProtocol {
    
}


//MARK: Presenter
protocol CategoryListViewToPresenterProtocol: TableViewToPresenterProtocol {
    func didLoad()
}

protocol CategoryListRouterToPresenterProtocol {
    
}

protocol CategoryListPresenterProtocol: PresenterDependenciesProtocol, CategoryListInputProtocol, CategoryListViewToPresenterProtocol, CategoryListRouterToPresenterProtocol {
    
}


//MARK: Interactor
protocol CategoryListPresenterToInteractorProtocol {
    func readCategories() -> Single<[CategoryData]>
    func save(category: CategoryData) -> Single<Bool>
}

protocol CategoryListInteractorProtocol: InteractorDependenciesProtocol, CategoryListPresenterToInteractorProtocol {
    
}


//MARK: Router
protocol CategoryListPresenterToRouterProtocol: CellFactoryProtocol {
    
}

protocol CategoryListRouterProtocol: RouterDependenciesProtocol, CategoryListPresenterToRouterProtocol {
    
}
