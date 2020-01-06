//
//  DatabaseError.swift
//  NewsAgregator
//
//  Created by Work on 03/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

///Ошибки работы с базой данных
enum DatabaseError: Error {
    case realm(_ error: Error)
    case unknown
}
