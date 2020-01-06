//
//  NewsListProtocols.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import RxSwift
import Viper

//MARK: Public protocols
protocol NewsListInputProtocol: AnyObject {
    
}

protocol NewsListOutputProtocol: AnyObject {
    
}

protocol NewsListComponentProtocol {
    var viewController: UIViewController! { get }
    var input: NewsListInputProtocol! { get }
}

//MARK: Internal protocols
//MARK: View
protocol NewsListPresenterToViewProtocol: TablePresenterToViewProtocol {
    func display(navigationTitle: String)
    func triggerRefreshControl()
}

protocol NewsListRouterToViewProtocol {
    
}

protocol NewsListViewProtocol: UIViewController, ViewDependenciesProtocol, NewsListPresenterToViewProtocol, NewsListRouterToViewProtocol {
    
}


//MARK: Presenter
protocol NewsListViewToPresenterProtocol: TableViewToPresenterProtocol {
    func didLoad()
    func willAppear()
    func didDisappear()
    func didPullToRefresh()
}

protocol NewsListRouterToPresenterProtocol {
    
}

protocol NewsListPresenterProtocol: PresenterDependenciesProtocol, NewsListInputProtocol, NewsListViewToPresenterProtocol, NewsListRouterToPresenterProtocol {
    
}


//MARK: Interactor
protocol NewsListPresenterToInteractorProtocol {
    func readNews() -> Single<[NewsItemData]>
    func requestNews() -> Single<[NewsItemData]>
    func save(newsItems: [NewsItemData]) -> Single<Bool>
    func markIsReading(_ newsItem: NewsItemData) -> Single<Bool>
    func readUpdateTimeInterval() -> Single<TimeInterval>
}

protocol NewsListInteractorProtocol: InteractorDependenciesProtocol, NewsListPresenterToInteractorProtocol {
    
}


//MARK: Router
internal protocol NewsListPresenterToRouterProtocol: CellFactoryProtocol {
    
}

internal protocol NewsListRouterProtocol: RouterDependenciesProtocol, NewsListPresenterToRouterProtocol {
    
}
