//
//  DatabaseService.swift
//  NewsAgregator
//
//  Created by Work on 03/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

class DatabaseService: DatabaseServiceProtocol {
    @Injected private var analyticsService: AnalyticsServiceProtocol!
    
    func setup() {
        var config = Realm.Configuration.defaultConfiguration
        config.schemaVersion = 1
        config.migrationBlock = { migration, oldSchemaVersion in
            ///миграции
        }
        Realm.Configuration.defaultConfiguration = config
    }
    
    func object<T: Object, KeyType>(primaryKey: KeyType) -> Single<T?> {
        Single<T?>.create { observer -> Disposable in
            DispatchQueue(label: "RealmAsyncRead").async {
                do {
                    let realm = try Realm()
                    let object = realm.object(ofType: T.self, forPrimaryKey: primaryKey)
                    observer(.success(object))
                }
                catch let error {
                    self.analyticsService.sendError(
                        NSError(domain: "DatabaseService Reading",
                                code: 0,
                                userInfo: nil),
                        additionalInfo: ["table": String(describing: T.self),
                                         "originalError": error]
                    )
                    
                    observer(.error(DatabaseError.realm(error)))
                }
            }
            return Disposables.create()
        }
    }
    
    func objects<T: Object>() -> Single<[T]> {
        Single<[T]>.create { observer -> Disposable in
            DispatchQueue(label: "RealmAsyncRead").async {
                do {
                    let realm = try Realm()
                    let objects = realm.objects(T.self)
                    let array = Array(objects)
                    observer(.success(array))
                }
                catch let error {
                    self.analyticsService.sendError(
                        NSError(domain: "DatabaseService Reading",
                                code: 0,
                                userInfo: nil),
                        additionalInfo: ["table": String(describing: T.self),
                                         "originalError": error]
                    )
                    
                    observer(.error(DatabaseError.realm(error)))
                }
            }
            return Disposables.create()
        }
    }
    
    func write(_ block: @escaping ((RealmProtocol) throws -> Void)) -> Single<Bool> {
        return Single<Bool>.create { observer in
            DispatchQueue(label: "RealmAsyncWrite").async {
                autoreleasepool {
                    do {
                        let realm = try Realm()
                        try realm.write {
                            try block(realm)
                        }
                        observer(.success(true))
                    }
                    catch let error {
                        self.analyticsService.sendError(
                            NSError(domain: "DatabaseService Writing",
                                    code: 0,
                                    userInfo: nil),
                            additionalInfo: ["originalError": error]
                        )
                        
                        observer(.error(DatabaseError.realm(error)))
                    }
                }
            }
            return Disposables.create()
        }.observeOn(MainScheduler.instance)
    }
}
