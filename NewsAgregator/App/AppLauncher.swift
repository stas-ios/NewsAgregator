//
//  AppLauncher.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import UIKit
import Viper

public class AppLauncher: AppLauncherProtocol {
    //MARK: Dependencies
    @Injected private var screen: UIScreen!
    @Injected private var moduleFactory: ModuleFactoryProtocol!
    @Injected private var databaseService: DatabaseServiceProtocol!
    @Injected private var analyticsService: AnalyticsServiceProtocol!
    @Injected private var networkingService: NetworkingServiceProtocol!
    
    //MARK: AppLauncherProtocol
    public func createWindow() -> UIWindow {
        let window = UIWindow()
        window.frame = screen.bounds
        return window
    }
    
    @available(iOS 13.0, *)
    public func createWindow(scene: UIWindowScene) -> UIWindow {
        let window = UIWindow()
        window.frame = scene.coordinateSpace.bounds
        window.windowScene = scene
        return window
    }
    
    public func setupServices() {
        analyticsService.setup()
        databaseService.setup()
        networkingService.setup()
    }
    
    public func present(window: UIWindow) {
        let component: TabCoordinatorComponentProtocol = moduleFactory.component(ofType: TabCoordinatorComponent.self)
        component.input.setup()
        window.rootViewController = component.viewController
        window.makeKeyAndVisible()
    }
}
