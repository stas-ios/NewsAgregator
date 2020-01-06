//
//  LoadableImageProtocols.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import RxSwift
import Viper

//MARK: Public protocols
protocol LoadableImageInputProtocol: AnyObject {
    func present(imageUrl: String?)
    func reset()
}

protocol LoadableImageOutputProtocol: AnyObject {
    
}

protocol LoadableImageComponentProtocol {
    var view: UIView! { get }
    var input: LoadableImageInputProtocol! { get }
}

//MARK: Internal protocols
//MARK: View
protocol LoadableImagePresenterToViewProtocol {
    func display(image: UIImage?)
    func display(loading: Bool)
}

protocol LoadableImageRouterToViewProtocol {
    
}

protocol LoadableImageViewProtocol: UIView, ViewDependenciesProtocol, LoadableImagePresenterToViewProtocol, LoadableImageRouterToViewProtocol {
    
}


//MARK: Presenter
protocol LoadableImageViewToPresenterProtocol {
    
}

protocol LoadableImageRouterToPresenterProtocol {
    
}

protocol LoadableImagePresenterProtocol: PresenterDependenciesProtocol, LoadableImageInputProtocol, LoadableImageViewToPresenterProtocol, LoadableImageRouterToPresenterProtocol {
    
}


//MARK: Interactor
protocol LoadableImagePresenterToInteractorProtocol {
    func requestImage(url: String) -> Single<UIImage>
}

protocol LoadableImageInteractorProtocol: InteractorDependenciesProtocol, LoadableImagePresenterToInteractorProtocol {
    
}


//MARK: Router
protocol LoadableImagePresenterToRouterProtocol {
    
}

protocol LoadableImageRouterProtocol: RouterDependenciesProtocol, LoadableImagePresenterToRouterProtocol {
    
}
