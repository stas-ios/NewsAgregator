//
//  BaseTabController.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import UIKit

///Базовый класс view для TabBar-модуля-координатора. Можно рассматривать, как обычный UITabBarController
open class BaseTabController<ViewToPresenter>: UITabBarController, ViewDependenciesProtocol {
    
    public var _presenter: AnyObject!
    public var presenter: ViewToPresenter { _presenter as! ViewToPresenter }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
