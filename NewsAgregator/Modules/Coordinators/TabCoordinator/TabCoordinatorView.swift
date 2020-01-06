//
//  TabCoordinatorView.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import UIKit
import Viper

class TabCoordinatorView: BaseTabController<
    TabCoordinatorViewToPresenterProtocol
>, TabCoordinatorViewProtocol {
    
    //MARK: TabCoordinatorPresenterToViewProtocol
    
    //MARK: TabCoordinatorRouterToViewProtocol
    func showSubmodules(_ submodules: [UIViewController]) {
        setViewControllers(submodules, animated: false)
    }
}
