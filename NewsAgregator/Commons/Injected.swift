//
//  Injected.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import Swinject

/**
 Дополнение для DI (swift 5.1+):
 - Использование:
    - `@Injected var service: Service!`
 - В приложении нужно заполнить Container.shared, потому что в @Injected используется именно он
 */
@propertyWrapper
struct Injected<Service> {
    private var service: Service?
    private var name: String?
    
    init() {
        self.init(nil)
    }
    
    init(_ name: String?) {
        self.name = name
    }
    
    var wrappedValue: Service {
        mutating get {
            if service == nil {
                service = Container.shared.resolve(Service.self, name: name)
            }
            return service!
        }
        mutating set {
            service = newValue
        }
    }
}

extension Container {
    ///Контейнер, используемый для разрешения зависимостей с помощью @Injected
    static let shared: Container = Container()
}
