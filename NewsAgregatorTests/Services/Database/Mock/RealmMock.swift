//
//  RealmMock.swift
//  NewsAgregatorTests
//
//  Created by Work on 06/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
@testable import NewsAgregator
import RealmSwift

class RealmMock: RealmProtocol {
    var objects = [Object]()
    
    var newsItems: [NewsItemRealmObject] {
        objects.compactMap { $0 as? NewsItemRealmObject }
    }
    var categories: [CategoryRealmObject] {
        objects.compactMap { $0 as? CategoryRealmObject }
    }
    var settings: [SettingsRealmObject] {
        objects.compactMap { $0 as? SettingsRealmObject }
    }
    
    func fill(categoryCount: Int,
              newsItemCount: Int) {
        for i in 0..<categoryCount {
            let category = CategoryRealmObject()
            category.name = "Category_\(i)"
            category.selected = Bool.random()
            objects.append(category)
        }
        
        for i in 0..<newsItemCount {
            let newsItem = NewsItemRealmObject()
            newsItem.guid = "NewsGuid_\(i)"
            newsItem.title = "NewsTitle_\(i)"
            newsItem.link = "NewsLink_\(i)"
            newsItem.descr = "NewsDescr_\(i)"
            newsItem.pubDate = Date(timeIntervalSince1970: Double(i) * 1e6)
            newsItem.category = object(ofType: CategoryRealmObject.self,
                                       forPrimaryKey: "Category_\(Int.random(in: 0..<categoryCount))")
            newsItem.source = Int.random(in: 0...1)
            newsItem.hasRead = true
            objects.append(newsItem)
        }
        
        let settingsProfile = SettingsRealmObject()
        settingsProfile.guid = "global"
        settingsProfile.updateTimeIntervalOption = Int.random(in: 0...(UpdateTimeInterval.allCases.count - 1))
        objects.append(settingsProfile)
    }
    
    //MARK: RealmProtocol
    func add(_ object: Object, update: Realm.UpdatePolicy) {
        //TODO: UpdatePolicy (сейчас везде .all)
        let pkKey = type(of: object).primaryKey()!
        let pkValue = object.value(forKey: pkKey) as! String
        if let index = objects
            .firstIndex(where: { obj in
                guard type(of: obj) == type(of: object) else {
                    return false
                }
                return obj.value(forKey: pkKey) as! String == pkValue
            }) {
            objects[index] = object
        }
        else {
            objects.append(object)
        }
    }
    
    func object<Element, KeyType>(ofType type: Element.Type, forPrimaryKey key: KeyType) -> Element? where Element : Object {
        let pkKey = Element.primaryKey()!
        return objects
            .compactMap({ $0 as? Element })
            .first(where: { $0.value(forKey: pkKey) as! String == key as! String })
    }
}
