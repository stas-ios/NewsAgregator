//
//  HTTPConnectorService.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift

class HTTPWrapperService: HTTPWrapperServiceProtocol {
    //MARK: Dependencies
    @Injected private var networkingService: NetworkingServiceProtocol!
    @Injected private var encoder: JSONEncoder!
    @Injected private var analyticsService: AnalyticsServiceProtocol!
    
    private var decoder: ResponseDecoderProtocol
    
    init(decoder: ResponseDecoderProtocol) {
        self.decoder = decoder
    }
    
    //MARK: HTTPWrapperServiceProtocol
    func request<RequestParams: Encodable, RequestHeaders: Encodable, Response: Decodable>(
        method: HTTPMethod,
        url: String,
        parameters: RequestParams?,
        headers: RequestHeaders?
    ) -> Single<Response> {
        let parametersAsDictionary: [String: Any]? = convertToDictionary(parameters)
        let headersAsDictionary: [String: String]? = convertToDictionary(headers) as? [String: String]
        
        return request(method: method,
                       url: url,
                       parametersDict: parametersAsDictionary,
                       headersDict: headersAsDictionary)
    }
    
    func request<RequestParams: Encodable, Response: Decodable>(method: HTTPMethod, url: String, parameters: RequestParams?) -> Single<Response> {
        let parametersAsDictionary: [String: Any]? = convertToDictionary(parameters)
        
        return request(method: method,
                       url: url,
                       parametersDict: parametersAsDictionary,
                       headersDict: nil)
    }
    
    func request<RequestHeaders: Encodable, Response: Decodable>(method: HTTPMethod, url: String, headers: RequestHeaders?) -> Single<Response> {
        let headersAsDictionary: [String: String]? = convertToDictionary(headers) as? [String: String]
        
        return request(method: method,
                       url: url,
                       parametersDict: nil,
                       headersDict: headersAsDictionary)
    }
    
    func request<Response: Decodable>(method: HTTPMethod, url: String) -> Single<Response> {
        return request(method: method,
                       url: url,
                       parametersDict: nil,
                       headersDict: nil)
    }
    
    //MARK: Private methods
    ///Преобразует параметры или хедеры запроса в словарь
    private func convertToDictionary<T: Encodable>(_ object: T?) -> [String: Any]? {
        guard let object = object,
            let data = try? encoder.encode(object),
            let dict = try? JSONSerialization.jsonObject(
                with: data,
                options: .fragmentsAllowed
            ) as? [String: Any] else {
                return nil
        }
        return dict
    }
    
    private func request<Response: Decodable>(
        method: HTTPMethod,
        url: String,
        parametersDict: [String : Any]?,
        headersDict: [String : String]?
    ) -> Single<Response> {
        return networkingService.dataRequest(
            method: method,
            url: url,
            parameters: parametersDict,
            headers: headersDict
        ).catchError { [weak self] error in
            //маппинг ошибок сети в NetworkError
            if (error as NSError).domain == NSURLErrorDomain {
                self?.analyticsService.sendError(
                    NSError(domain: "HTTPWrapperService Networking",
                            code: 0,
                            userInfo: nil),
                    additionalInfo: ["originalError": error]
                )
                let networkError = NetworkError(code: (error as NSError).code)
                return Single<(HTTPURLResponse, Data)>.error(networkError)
            }
            return Single<(HTTPURLResponse, Data)>.error(NetworkError.unknown)
        }.map { [weak self] (response, data) in
            //парсинг ответа
            guard let `self` = self else {
                throw NetworkError.cancelled
            }
            do {
                let result = try self.decoder.decode(Response.self, from: data)
                return result
            }
            catch let error {
                self.analyticsService.sendError(
                    NSError(domain: "HTTPWrapperService Parsing",
                            code: 0,
                            userInfo: nil),
                    additionalInfo: ["url": url,
                                     "response": response,
                                     "data": data,
                                     "originalError": error])
                throw NetworkError.parseError
            }
        }
    }
}
