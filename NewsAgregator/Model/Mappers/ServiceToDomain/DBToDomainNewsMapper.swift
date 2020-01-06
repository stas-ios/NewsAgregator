//
//  DBToDomainNewsMapper.swift
//  NewsAgregator
//
//  Created by Work on 03/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

class DBToDomainNewsMapper: Mapper {
    static func map(_ source: NewsItemDBDTO) -> NewsItemData {
        return NewsItemData(guid: source.guid,
                            title: source.title,
                            link: source.link,
                            description: source.descr,
                            pubDate: source.pubDate,
                            imageUrl: source.imageUrl,
                            category: source.category.name,
                            source: NewsItemData.Source(rawValue: source.source),
                            hasRead: source.hasRead,
                            showDetails: source.isReading)
    }
}
