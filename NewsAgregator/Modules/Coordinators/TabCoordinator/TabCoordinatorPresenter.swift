//
//  TabCoordinatorPresenter.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import Foundation
import Viper

class TabCoordinatorPresenter: BasePresenter<
    TabCoordinatorPresenterToViewProtocol,
    TabCoordinatorPresenterToInteractorProtocol,
    TabCoordinatorPresenterToRouterProtocol,
    TabCoordinatorOutputProtocol
>, TabCoordinatorPresenterProtocol {
    
    //MARK: TabCoordinatorInputProtocol
    func setup() {
        //две вкладки: новости и настройки
        router.attachChildCoordinators([
            .news(screens: [.newsList]),
            .settings(screens: [.settings])
        ])
    }
    
    //MARK: TabCoordinatorViewToPresenterProtocol
    
    //MARK: NewsCoordinatorOutputProtocol
    
    //MARK: SettingsCoordinatorOutputProtocol
}
