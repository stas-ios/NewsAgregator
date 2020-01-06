//
//  SettingsRealmObject.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RealmSwift

class SettingsRealmObject: Object {
    @objc dynamic var guid: String!
    @objc dynamic var updateTimeIntervalOption: Int = 0
    
    override static func primaryKey() -> String? {
        return "guid"
    }
}
