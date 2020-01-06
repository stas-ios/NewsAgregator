//
//  NetworkingServiceProtocol.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

///Обёртка вокруг RxAlamofire. Снимает конкретную зависимость от Alamofire.HTTPMethod и позволяет заменить работу с сетью в тестах.
protocol NetworkingServiceProtocol {
    func setup()
    
    func dataRequest(
        method: HTTPMethod,
        url: String,
        parameters: [String: Any]?,
        headers: [String: String]?
    ) -> Single<(HTTPURLResponse, Data)>
}
