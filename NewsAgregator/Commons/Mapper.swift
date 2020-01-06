//
//  Mapper.swift
//  NewsAgregator
//
//  Created by Work on 31/12/2019.
//  Copyright © 2019 Work. All rights reserved.
//

import Foundation

protocol Mapper {
    associatedtype Source
    associatedtype Dest
    
    static func map(_ source: Source) -> Dest
}

extension Mapper {
    static func map(_ optional: Source?) -> Dest? {
        return (optional != nil) ? map(optional!) : nil
    }
    
    static func map(_ array: [Source]) -> [Dest] {
        return array.map({ map($0) })
    }
}
