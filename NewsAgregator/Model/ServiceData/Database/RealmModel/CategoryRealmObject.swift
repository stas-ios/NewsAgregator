//
//  CategoryRealmObject.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryRealmObject: Object {
    @objc dynamic var name: String!
    @objc dynamic var selected: Bool = true
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
