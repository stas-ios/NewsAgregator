//
//  BaseViewController.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import UIKit

///Базовый класс View для модулей-экранов. Отвечает за отображение данных, которые получает от презентера в готовом к отображению виде. Кроме того, передаёт события ViewController-а (viewDidLoad, viewWillAppear итд) презентеру.
open class BaseViewController<ViewToPresenter>: UIViewController, ViewDependenciesProtocol, ScreenPresenterToViewProtocol {
    
    public var _presenter: AnyObject!
    public var presenter: ViewToPresenter { _presenter as! ViewToPresenter }
    
    //MARK: ScreenPresenterToViewProtocol
    open func display(navigationTitle: String) {
        navigationItem.title = navigationTitle
    }
}
