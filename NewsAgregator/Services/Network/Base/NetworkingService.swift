//
//  NetworkingService.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import Alamofire

class NetworkingService: NetworkingServiceProtocol {
    private var sessionManager: SessionManager!
    
    //MARK: NetworkingServiceProtocol
    func setup() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForRequest = 30.0
        sessionManager = SessionManager(configuration: configuration)
    }
    
    func dataRequest(
        method: HTTPMethod,
        url: String,
        parameters: [String : Any]?,
        headers: [String : String]?
    ) -> Single<(HTTPURLResponse, Data)> {
        sessionManager.rx.responseData(
            Alamofire.HTTPMethod(rawValue: method.rawValue)!,
            url,
            parameters: parameters,
            headers: headers
        ).asSingle()
    }
}
