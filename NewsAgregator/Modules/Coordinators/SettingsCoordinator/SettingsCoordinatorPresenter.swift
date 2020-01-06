//
//  SettingsCoordinatorPresenter.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import Viper

class SettingsCoordinatorPresenter: BasePresenter<
    SettingsCoordinatorPresenterToViewProtocol,
    SettingsCoordinatorPresenterToInteractorProtocol,
    SettingsCoordinatorPresenterToRouterProtocol,
    SettingsCoordinatorOutputProtocol
>, SettingsCoordinatorPresenterProtocol {
    
    //MARK: SettingsCoordinatorInputProtocol
    func setup() {
        view.displayTabBarItem(title: "Настройки")
    }
    
    func setScreens(_ screens: [SettingsStackElement]) {
        router.setScreens(screens)
    }
    
    //MARK: SettingsCoordinatorViewToPresenterProtocol
    
    //MARK: SettingsOutputProtocol
    func didSelectCategoriesCellOnSettingsScreen() {
        //При нажатии на ячейку с категориями в настройках открываем экран со списком категорий
        router.push(.categoryList)
    }
    
    func didSelectTimeIntervalCellOnSettingsScreen() {
        //При нажатии на ячейку с интервалом автообновления в настройках открываем экран выбора частоты обновлений
        router.push(.timeIntervalPicker)
    }
    
    //MARK: TimeIntervalPickerOutputProtocol
    func timeIntervalPickerDidSelect(timeInterval: UpdateTimeInterval) {
        router.popTimeIntervalPicker()
    }
}
