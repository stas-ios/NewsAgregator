//
//  BaseNavigationController.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import UIKit

///Базовый класс view для модулей-координаторов с навигацией. В общем, обычный UINavigationController
open class BaseNavigationController<ViewToPresenter>: UINavigationController, ViewDependenciesProtocol, NavigationPresenterToViewProtocol, NavigationRouterToViewProtocol {
    
    public var _presenter: AnyObject!
    public var presenter: ViewToPresenter { _presenter as! ViewToPresenter }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: NavigationPresenterToViewProtocol
    public func displayTabBarItem(title: String) {
        tabBarItem.title = title
    }
}

