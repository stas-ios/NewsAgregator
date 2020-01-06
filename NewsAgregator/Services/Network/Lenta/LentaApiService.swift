//
//  LentaApiService.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import XMLCoder

class LentaApiService: LentaApiServiceProtocol {
    //MARK: Dependencies
    @Injected("xml") private var httpService: HTTPWrapperServiceProtocol!
    
    private let baseUrl = "http://lenta.ru/"
    
    enum ApiMethod: String {
        case rss = "rss"
    }
    
    //MARK: LentaApiServiceProtocol
    func requestRss() -> Single<RssDTO> {
        return httpService.request(method: .get,
                                   url: baseUrl + ApiMethod.rss.rawValue)
    }
}
