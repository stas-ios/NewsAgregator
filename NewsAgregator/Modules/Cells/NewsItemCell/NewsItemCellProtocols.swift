//
//  NewsItemCellProtocols.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

//MARK: Public protocols
protocol NewsItemCellInputProtocol: AnyObject {
    func setup()
}

protocol NewsItemCellOutputProtocol: AnyObject {
    func didSelectNewsItemCell(indexPath: IndexPath)
}

protocol NewsItemCellComponentProtocol {
    var cell: CellProtocol! { get }
    var input: NewsItemCellInputProtocol! { get }
}

//MARK: Internal protocols
//MARK: View
protocol NewsItemCellPresenterToViewProtocol {
    func display(title: String)
    func display(date: String)
    func display(source: String)
    func display(description: String)
    func display(fullMode: Bool)
    func display(hasRead: Bool)
}

protocol NewsItemCellRouterToViewProtocol {
    func addLoadableImage(_ view: UIView)
}

protocol NewsItemCellViewProtocol: CellProtocol, ViewDependenciesProtocol, NewsItemCellPresenterToViewProtocol, NewsItemCellRouterToViewProtocol {
    
}


//MARK: Presenter
protocol NewsItemCellViewToPresenterProtocol {
    func prepareForReuse()
    func present(_ data: Any, indexPath: IndexPath)
}

protocol NewsItemCellRouterToPresenterProtocol: LoadableImageOutputProtocol {
    
}

protocol NewsItemCellPresenterProtocol: PresenterDependenciesProtocol, NewsItemCellInputProtocol, NewsItemCellViewToPresenterProtocol, NewsItemCellRouterToPresenterProtocol {
    
}


//MARK: Interactor
protocol NewsItemCellPresenterToInteractorProtocol {
    
}

protocol NewsItemCellInteractorProtocol: InteractorDependenciesProtocol, NewsItemCellPresenterToInteractorProtocol {
    
}


//MARK: Router
protocol NewsItemCellPresenterToRouterProtocol {
    func attachLoadableImage()
    func loadImage(url: String?)
    func resetLoadableImage()
}

protocol NewsItemCellRouterProtocol: RouterDependenciesProtocol, NewsItemCellPresenterToRouterProtocol {
    
}
