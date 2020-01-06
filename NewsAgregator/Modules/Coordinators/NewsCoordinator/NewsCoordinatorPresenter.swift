//
//  NewsCoordinatorPresenter.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import Viper

class NewsCoordinatorPresenter: BasePresenter<
    NewsCoordinatorPresenterToViewProtocol,
    NewsCoordinatorPresenterToInteractorProtocol,
    NewsCoordinatorPresenterToRouterProtocol,
    NewsCoordinatorOutputProtocol
>, NewsCoordinatorPresenterProtocol {
    
    //MARK: NewsCoordinatorInputProtocol
    func setup() {
        view.displayTabBarItem(title: "Новости")
    }
    
    func setScreens(_ screens: [NewsStackElement]) {
        router.setScreens(screens)
    }
    
    //MARK: NewsCoordinatorViewToPresenterProtocol
    
    //MARK: NewsListOutputProtocol
}
