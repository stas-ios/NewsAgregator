//
//  NetworkError.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

///Ошибки работы с сетью
enum NetworkError: Error {
    case connectionError //ошибка связи
    case serviceUnavailable //недоступность бэкенда по разным причинам
    case parseError //неверный формат данных
    case cancelled //отмена запроса
    case unknown //прочие ошибки
    
    init(code: Int) {
        switch code {
        case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost:
            self = .connectionError
            break
        case NSURLErrorCannotFindHost, NSURLErrorDNSLookupFailed, NSURLErrorBadServerResponse:
            self = .serviceUnavailable
            break
        case NSURLErrorCancelled:
            self = .cancelled
            break
        default:
            self = .unknown
            break
        }
    }
}
