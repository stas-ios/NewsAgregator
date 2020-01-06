//
//  Observable+forceUnwrap.swift
//  NewsAgregator
//
//  Created by Work on 06/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift

enum RxSwiftExtensionError: Error {
    case forceUnwrappingDefaultError
}

protocol OptionalType {
    associatedtype Wrapped
    
    var optional: Wrapped? { get }
}

extension Optional: OptionalType {
    public var optional: Wrapped? { return self }
}

extension Observable where Element: OptionalType {
    //снимает optional, если nil - кидает ошибку
    func forceUnwrap(orThrow error: Error = RxSwiftExtensionError.forceUnwrappingDefaultError) -> Observable<Element.Wrapped> {
        return map({
            guard let value = $0.optional else {
                throw error
            }
            return value
        })
    }
}

extension Single where Element: OptionalType {
    //снимает optional, если nil - кидает ошибку
    func forceUnwrap(orThrow error: Error = RxSwiftExtensionError.forceUnwrappingDefaultError) -> Single<Element.Wrapped> {
        return asObservable().forceUnwrap(orThrow: error).asSingle()
    }
}
