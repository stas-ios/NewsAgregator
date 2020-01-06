//
//  NetworkingServiceMock.swift
//  NewsAgregatorTests
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift
@testable import NewsAgregator

///Заглушка для сетевого сервиса
class NetworkingServiceMock: NetworkingServiceProtocol {
    private let filename: String? //имя файла, из которого читать данные
    public var error: Error? //если error задан, то будет возвращать ошибку
    
    //входные параметры метода dataRequest
    struct InputParams {
        let method: HTTPMethod
        let url: String
        let parameters: [String: Any]?
        let headers: [String: String]?
    }
    var inputParams: InputParams?
    
    init(filename: String?) {
        self.filename = filename
    }
    
    func setup() {
        
    }
    
    func dataRequest(method: HTTPMethod,
                     url: String,
                     parameters: [String : Any]?,
                     headers: [String : String]?) -> Single<(HTTPURLResponse, Data)> {
        //сохраняем входные параметры, чтобы в тестах проверить, что они правильно мапятся
        inputParams = InputParams(method: method,
                                  url: url,
                                  parameters: parameters,
                                  headers: headers)
        
        //если инициализировали с ошибкой, возвращаем ошибку
        if let error = error {
            return Single.error(error)
        }
        
        //читаем данные из файла - если не читается, возвращаем ошибку
        let bundle = Bundle(for: Self.self)
        guard let filename = filename,
            let fileUrl = bundle.url(forResource: filename, withExtension: nil) else {
            return Single.error(NetworkError.unknown)
        }
        do {
            let data = try Data(contentsOf: fileUrl)
            return Single.just((HTTPURLResponse(), data))
        }
        catch {
            return Single.error(NetworkError.unknown)
        }
    }
}
