//
//  LibAssembly.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import Swinject
import RxSwift
import XMLCoder
import Kingfisher

class LibAssembly: Assembly {
    func assemble(container: Container) {
        //MARK: Apple
        container.register(UIScreen.self) { _ in UIScreen.main }
            .inObjectScope(.container)
        container.register(Bundle.self) { _ in Bundle.main }
            .inObjectScope(.container)
        container.register(JSONEncoder.self) { _ in JSONEncoder() }
            .inObjectScope(.weak)
        container.register(NotificationCenter.self, factory: { _ in NotificationCenter.default }).inObjectScope(.container)
        
        //MARK: RxSwift
        container.register(DisposeBag.self) { _ in DisposeBag() }
            .inObjectScope(.transient)
        container.register(KingfisherManager.self) { _ in KingfisherManager.shared }
            .inObjectScope(.weak)
        
        //MARK: XMLCoder
        container.register(XMLDecoder.self) { r in
            let decoder = XMLDecoder()
            let dateFormatter = r.resolve(DateFormatter.self, name: "rss")!
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            return decoder
        }.inObjectScope(.weak)
        
        //MARK: DateFormatters
        container.register(DateFormatter.self, name: "rss") { _ in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E, dd MMM yyyy HH:mm:ss Z"
            return dateFormatter
        }
        
        container.register(DateFormatter.self, name: "readable") { _ in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMMM yyyy HH:mm:ss"
            return dateFormatter
        }
    }
}
