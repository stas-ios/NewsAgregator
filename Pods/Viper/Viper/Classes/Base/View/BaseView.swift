//
//  BaseView.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit

///Базовый класс View для UIView-модулей. Отвечает за отображение данных, которые получает от презентера в готовом к отображению виде.
open class BaseView<ViewToPresenter>: UIView, ViewDependenciesProtocol {
    
    public var _presenter: AnyObject!
    public var presenter: ViewToPresenter { _presenter as! ViewToPresenter }
}
