//
//  AppLauncherProtocol.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import UIKit

///Сервис запуска приложения
protocol AppLauncherProtocol: AnyObject {
    /**
     Создаёт полноэкранное окно
     - parameters:
        - screen: экран, по размеру которого создаётся окно
     - returns:
        новое окно
     */
    func createWindow() -> UIWindow
    
    /**
     Создаёт окно и привязывает его к сцене
     - parameters:
        - scene: сцена, в которой создаётся окно
     - returns:
        новое окно
     */
    @available(iOS 13.0, *)
    func createWindow(scene: UIWindowScene) -> UIWindow
    
    /**
     Инициализирует сервисы приложения
     */
    func setupServices()
    
    /**
     Создаёт RootViewController и показывает его пользователю
     - parameters:
        - window: окно, в которое нужно добавить RootViewController (создаётся в AppDelegate или SceneDelegate)
     */
    func present(window: UIWindow)
}
