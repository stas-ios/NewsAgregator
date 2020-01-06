//
//  TimeIntervalPickerAssembly.swift
//  NewsAgregator
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Swinject

class TimeIntervalPickerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TimeIntervalPickerViewProtocol.self) { _ in
            let bundle = Bundle(for: TimeIntervalPickerView.self)
            let storyboard = UIStoryboard(name: "TimeIntervalPicker", bundle: bundle)
            return storyboard.instantiateInitialViewController() as! TimeIntervalPickerViewProtocol
        }.inObjectScope(.transient)
        
        container.register(TimeIntervalPickerPresenterProtocol.self) { _ in TimeIntervalPickerPresenter() }
            .inObjectScope(.transient)
            
        container.register(TimeIntervalPickerInteractorProtocol.self) { _ in TimeIntervalPickerInteractor() }
            .inObjectScope(.transient)
        
        container.register(TimeIntervalPickerRouterProtocol.self) { _ in TimeIntervalPickerRouter() }
            .inObjectScope(.transient)
    }
}
