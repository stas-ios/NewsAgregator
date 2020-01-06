//
//  DomainToDBNewsMapper.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

class DomainToDBNewsMapper: Mapper {
    static func map(_ source: NewsItemData) -> NewsItemDBDTO {
        let category =  CategoryDBDTO(name: source.category,
                                      isSelected: true)
        return NewsItemDBDTO(
            guid: source.guid,
            title: source.title,
            link: source.link,
            descr: source.description,
            pubDate: source.pubDate,
            imageUrl: source.imageUrl,
            category: category,
            source: source.source?.rawValue ?? -1,
            hasRead: source.hasRead,
            isReading: source.showDetails)
    }
}
