//
//  RealmProtocol.swift
//  NewsAgregator
//
//  Created by Work on 06/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmProtocol {
    func add(_ object: Object, update: Realm.UpdatePolicy)
    
    func object<Element: Object, KeyType>(ofType type: Element.Type, forPrimaryKey key: KeyType) -> Element?
}

extension Realm: RealmProtocol {
    
}
