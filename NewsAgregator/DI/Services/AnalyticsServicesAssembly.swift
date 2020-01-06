//
//  AnalyticsServicesAssembly.swift
//  NewsAgregator
//
//  Created by Work on 06/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Swinject

class AnalyticsServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AnalyticsServiceProtocol.self) { _ in AnalyticsService() }
            .inObjectScope(.weak)
    }
}
