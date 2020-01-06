//
//  ResponseDecoderProtocol.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import XMLCoder

///Общий протокол для декодирования данных в JSON и XML. Позволяет использовать один и тот же HTTPWrapperService для работы с разными форматами данных.
protocol ResponseDecoderProtocol {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}

extension JSONDecoder: ResponseDecoderProtocol {
    
}

extension XMLDecoder: ResponseDecoderProtocol {
    
}
