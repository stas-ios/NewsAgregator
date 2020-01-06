//
//  NetworkServicesAssembly.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Swinject
import XMLCoder

class NetworkServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LentaApiServiceProtocol.self) { _ in LentaApiService() }.inObjectScope(.weak)
        container.register(GazetaApiServiceProtocol.self) { _ in GazetaApiService() }.inObjectScope(.weak)
        
        container.register(NetworkingServiceProtocol.self) { _ in NetworkingService() }.inObjectScope(.weak)
        container.register(HTTPWrapperServiceProtocol.self, name: "xml") { r in
            let xmlDecoder = r.resolve(XMLDecoder.self)!
            return HTTPWrapperService(decoder: xmlDecoder)
        }.inObjectScope(.weak)
    }
}
