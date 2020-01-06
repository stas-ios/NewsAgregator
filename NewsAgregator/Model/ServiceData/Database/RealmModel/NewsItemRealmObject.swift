//
//  NewsItemRealmObject.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RealmSwift

class NewsItemRealmObject: Object {
    @objc dynamic var guid: String!
    @objc dynamic var title: String!
    @objc dynamic var link: String?
    @objc dynamic var descr: String?
    @objc dynamic var pubDate: Date!
    @objc dynamic var imageUrl: String?
    @objc dynamic var category: CategoryRealmObject!
    @objc dynamic var source: Int = -1
    @objc dynamic var hasRead: Bool = false
    @objc dynamic var isReading: Bool = false
    
    override static func primaryKey() -> String? {
        return "guid"
    }
}

