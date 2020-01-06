//
//  HTTPWrapperServiceMock.swift
//  NewsAgregatorTests
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
@testable import NewsAgregator
import RxSwift

class HTTPWrapperServiceMock: HTTPWrapperServiceProtocol {
    //возвращает всегда одни и те же данные, применим только для получения RssDTO
    let outputRss: RssDTO
    let error: Error?
    
    struct InputParams {
        let method: HTTPMethod
        let url: String
    }
    var inputParams: InputParams?
    
    init(error: Error? = nil) {
        let items = [
            RssItemDTO(guid: "guidValue",
                       title: "titleValue",
                       author: "authorValue",
                       link: "linkValue",
                       description: "descriptionValue",
                       pubDate: Date(timeIntervalSince1970: 1234543),
                       enclosure: RssEnclosureDTO(url: "imageUrlValue"),
                       category: "categoryValue")
        ]
        let channel = RssChannelDTO(item: items)
        outputRss = RssDTO(channel: channel)
        
        self.error = error
    }
    
    func request<Response: Decodable>(
        method: HTTPMethod,
        url: String
    ) -> Single<Response> {
        inputParams = InputParams(method: method, url: url)
        
        if let error = error {
            return Single<Response>.error(error)
        }
        return Single<Response>.just(outputRss as! Response)
    }
    
    //Эти методы пока не используются в приложении и в тестах, можно реализовать позже
    func request<RequestParams: Encodable, RequestHeaders: Encodable, Response: Decodable>(
        method: HTTPMethod,
        url: String,
        parameters: RequestParams?,
        headers: RequestHeaders?
    ) -> Single<Response> {
        return .error(NSError())
    }
    
    func request<RequestParams: Encodable, Response: Decodable>(
        method: HTTPMethod,
        url: String,
        parameters: RequestParams?
    ) -> Single<Response> {
        return .error(NSError())
    }
    
    func request<RequestHeaders: Encodable, Response: Decodable>(
        method: HTTPMethod,
        url: String,
        headers: RequestHeaders?
    ) -> Single<Response> {
        return .error(NSError())
    }
}
