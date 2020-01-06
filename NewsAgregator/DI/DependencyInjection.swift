//
//  SharedAssembler.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import Swinject

class DependencyInjection {
    static func setup() {
        _ = Assembler([
            AppAssembly(),
            LibAssembly(),
            
            //MARK: Coordinators
            TabCoordinatorAssembly(),
            NewsCoordinatorAssembly(),
            SettingsCoordinatorAssembly(),
            
            //MARK: Screens
            NewsListAssembly(),
            SettingsAssembly(),
            CategoryListAssembly(),
            TimeIntervalPickerAssembly(),
            
            //MARK: Views
            LoadableImageAssembly(),
            
            //MARK: Cells
            NewsItemCellAssembly(),
            
            //MARK: Services
            NetworkServicesAssembly(),
            DatabaseServicesAssembly(),
            AnalyticsServicesAssembly()
        ], container: Container.shared)
    }
}

