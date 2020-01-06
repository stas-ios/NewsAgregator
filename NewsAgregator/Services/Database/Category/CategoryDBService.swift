//
//  CategoryDBService.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

class CategoryDBService: CategoryDBServiceProtocol {
    @Injected private var databaseService: DatabaseServiceProtocol!
    
    func readCategories() -> Single<[CategoryDBDTO]> {
        let objects: Single<[CategoryRealmObject]> = databaseService.objects()
        return objects
            .map({ RealmToDBCategoryMapper.map($0) })
            //до этого момента работали с Realm-объектами, которые должны использоваться в том же потоке, где читались
            .observeOn(MainScheduler.instance)
    }
    
    func markSelected(name: String, isSelected: Bool) -> Single<Bool> {
        return databaseService.write { [weak self] realm in
            guard let `self` = self else { throw NSError() }
            let object = self.getOrCreateCategory(realm: realm, name: name)
            object.selected = isSelected
            realm.add(object, update: .all)
        }
    }
    
    //MARK: Private methods
    private func getOrCreateCategory(realm: RealmProtocol, name: String) -> CategoryRealmObject {
        if let object = realm.object(ofType: CategoryRealmObject.self,
                                     forPrimaryKey: name) {
            return object
        }
        let object = CategoryRealmObject()
        object.name = name
        return object
    }
}
