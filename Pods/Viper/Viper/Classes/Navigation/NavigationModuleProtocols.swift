//
//  NavigationModuleProtocols.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit

///Методы UINavigationController-а, доступные роутерам модулей-координаторов
public protocol NavigationRouterToViewProtocol {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    @discardableResult func popViewController(animated: Bool) -> UIViewController?
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool)
}

public protocol NavigationPresenterToViewProtocol {
    func displayTabBarItem(title: String)
}
