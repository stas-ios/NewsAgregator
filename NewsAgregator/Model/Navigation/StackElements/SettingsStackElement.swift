//
//  SettingsScreen.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

///Экраны в стеке настроек
enum SettingsStackElement {
    ///Главный экран настроек
    case settings
    
    ///Выбор категорий
    case categoryList
    
    ///Выбор интервала автообновления
    case timeIntervalPicker
}
