//
//  DatabaseServiceMock.swift
//  NewsAgregatorTests
//
//  Created by Work on 06/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
@testable import NewsAgregator
import RxSwift
import RealmSwift

class DatabaseServiceMock: DatabaseServiceProtocol {
    let realmMock = RealmMock()
    
    let categoryCount: Int
    let newsItemCount: Int
    
    init(categoryCount: Int,
         newsItemCount: Int) {
        self.categoryCount = categoryCount
        self.newsItemCount = newsItemCount
    }
    
    func setup() {
        realmMock.fill(categoryCount: categoryCount,
                       newsItemCount: newsItemCount)
    }
    
    func object<T, KeyType>(primaryKey: KeyType) -> Single<T?> where T : Object {
        return .just(realmMock.object(ofType: T.self, forPrimaryKey: primaryKey))
    }
    
    func objects<T: Object>() -> Single<[T]> {
        return Single.create { [unowned self] observer in
            do {
                let objects = self.realmMock.objects
                    .compactMap({ $0 as? T })
                observer(.success(objects))
            }
            return Disposables.create()
        }
    }
    
    func write(_ block: @escaping ((RealmProtocol) throws -> Void)) -> Single<Bool> {
        return Single.create { [unowned self] observer in
            do {
                try block(self.realmMock)
                observer(.success(true))
            }
            catch let error {
                observer(.error(error))
            }
            return Disposables.create()
        }
    }
}
