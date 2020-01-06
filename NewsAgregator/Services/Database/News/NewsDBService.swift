//
//  NewsDBService.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

class NewsDBService: NewsDBServiceProtocol {
    @Injected private var databaseService: DatabaseServiceProtocol!
    
    func readNewsItems() -> Single<[NewsItemDBDTO]> {
        let objects: Single<[NewsItemRealmObject]> = databaseService.objects()
        return objects
            .map({ RealmToDBNewsMapper.map($0) })
            //до этого момента работали с Realm-объектами, которые должны использоваться в том же потоке, где читались
            .observeOn(MainScheduler.instance)
    }
    
    func save(_ news: [NewsItemDBDTO]) -> Single<Bool> {
        return databaseService.write { [weak self] realm in
            guard let `self` = self else { throw NSError() }
            for item in news {
                let object = self.getOrCreateNewsItem(realm: realm, guid: item.guid)
                self.mapItem(realm: realm, source: item, dest: object)
                realm.add(object, update: .all)
            }
        }
    }
    
    func markIsReading(guid: String, flag: Bool) -> Single<Bool> {
        return databaseService.write { [weak self] realm in
            guard let `self` = self else { throw NSError() }
            let object = self.getOrCreateNewsItem(realm: realm, guid: guid)
            object.isReading = flag
            if flag {
                object.hasRead = flag
            }
            realm.add(object, update: .all)
        }
    }
    
    //MARK: Private methods
    
    ///Если новость есть в базе, вытаскиваем её, чтобы сохранилась пометка о прочтении; если нет - создаём новую запись
    private func getOrCreateNewsItem(realm: RealmProtocol, guid: String) -> NewsItemRealmObject {
        if let object = realm.object(ofType: NewsItemRealmObject.self,
                                     forPrimaryKey: guid) {
            return object
        }
        let object = NewsItemRealmObject()
        object.guid = guid
        return object
    }
    
    private func mapItem(realm: RealmProtocol, source: NewsItemDBDTO, dest: NewsItemRealmObject) {
        dest.title = source.title
        dest.link = source.link
        dest.descr = source.descr
        dest.pubDate = source.pubDate
        dest.imageUrl = source.imageUrl
        dest.source = source.source
        dest.category = getOrCreateCategory(realm: realm, name: source.category.name)
    }
    
    ///чтение из базы или создание новой категории
    private func getOrCreateCategory(realm: RealmProtocol, name: String?) -> CategoryRealmObject? {
        guard let name = name else {
            return nil
        }
        if let object = realm.object(ofType: CategoryRealmObject.self,
                                     forPrimaryKey: name) {
            return object
        }
        let object = CategoryRealmObject()
        object.name = name
        realm.add(object, update: .all)
        return object
    }
}
