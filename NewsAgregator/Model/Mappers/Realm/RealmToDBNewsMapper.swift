//
//  RealmToDBNewsMapper.swift
//  NewsAgregator
//
//  Created by Work on 03/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

class RealmToDBNewsMapper: Mapper {
    static func map(_ source: NewsItemRealmObject) -> NewsItemDBDTO {
        return NewsItemDBDTO(guid: source.guid,
                             title: source.title,
                             link: source.link,
                             descr: source.descr,
                             pubDate: source.pubDate,
                             imageUrl: source.imageUrl,
                             category: RealmToDBCategoryMapper.map(source.category),
                             source: source.source,
                             hasRead: source.hasRead,
                             isReading: source.isReading)
    }
}
