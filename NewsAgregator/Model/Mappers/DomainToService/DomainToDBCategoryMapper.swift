//
//  DomainToDBCategoryMapper.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

class DomainToDBCategoryMapper: Mapper {
    static func map(_ source: CategoryData) -> CategoryDBDTO {
        return CategoryDBDTO(name: source.name,
                             isSelected: source.isSelected)
    }
}
