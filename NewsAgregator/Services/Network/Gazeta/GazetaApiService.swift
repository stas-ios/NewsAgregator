//
//  GazetaApiService.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift
import XMLCoder

class GazetaApiService: GazetaApiServiceProtocol {
    //MARK: Dependencies
    @Injected("xml") private var httpService: HTTPWrapperServiceProtocol!
    
    private let baseUrl = "https://www.gazeta.ru/export/"
    
    enum ApiMethod: String {
        case rss = "rss/lenta.xml"
    }
    
    //MARK: GazetaApiServiceProtocol
    func requestRss() -> Single<RssDTO> {
        return httpService.request(method: .get,
                                   url: baseUrl + ApiMethod.rss.rawValue)
    }
}
