//
//  HTTPWrapperServiceProtocol.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift

///Протокол базового сервиса для HTTP-запросов. Для параметров и хедеров принимает уже не словарь, а структуры данных, так же с возвращаемым объектом (в данном приложении RssResponseDTO)
protocol HTTPWrapperServiceProtocol {
    func request<RequestParams: Encodable, RequestHeaders: Encodable, Response: Decodable>(
        method: HTTPMethod,
        url: String,
        parameters: RequestParams?,
        headers: RequestHeaders?
    ) -> Single<Response>
    
    // Использование generic-ов требует явного указания типов в запросе, если хедеров или параметров нет. Поэтому следующие методы для удобства:
    
    func request<RequestParams: Encodable, Response: Decodable>(
        method: HTTPMethod,
        url: String,
        parameters: RequestParams?
    ) -> Single<Response>
    
    func request<RequestHeaders: Encodable, Response: Decodable>(
        method: HTTPMethod,
        url: String,
        headers: RequestHeaders?
    ) -> Single<Response>
    
    func request<Response: Decodable>(
        method: HTTPMethod,
        url: String
    ) -> Single<Response>
}
