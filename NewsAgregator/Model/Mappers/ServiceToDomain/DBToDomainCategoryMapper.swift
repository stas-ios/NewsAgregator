//
//  DBToDomainCategoryMapper.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

class DBToDomainCategoryMapper: Mapper {
    static func map(_ source: CategoryDBDTO) -> CategoryData {
        return CategoryData(name: source.name,
                            isSelected: source.isSelected)
    }
}
