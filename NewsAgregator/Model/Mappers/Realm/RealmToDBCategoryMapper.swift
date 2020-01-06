//
//  RealmToDBCategoryMapper.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

class RealmToDBCategoryMapper: Mapper {
    static func map(_ source: CategoryRealmObject) -> CategoryDBDTO {
        return CategoryDBDTO(name: source.name,
                             isSelected: source.selected)
    }
}
