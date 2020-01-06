//
//  NavigationStack.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

///Стеки навигации во вкладках TabBarController-а
enum NavigationStack {
    ///Стек вкладки новостей
    case news(screens: [NewsStackElement])
    
    ///Стек вкладки настроек
    case settings(screens: [SettingsStackElement])
}
