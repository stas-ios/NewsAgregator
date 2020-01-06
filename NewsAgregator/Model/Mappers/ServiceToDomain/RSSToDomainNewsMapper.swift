//
//  RSSToDomainNewsMapper.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

class RSSToDomainNewsMapper: Mapper {
    static func map(_ source: RssDTO) -> [NewsItemData] {
        (source.channel?.item ?? []).compactMap({ map(item: $0) })
    }
    
    private static func map(item: RssItemDTO) -> NewsItemData? {
        guard let guid = item.guid,
            let title = item.title,
            let pubDate = item.pubDate else { return nil }
        return NewsItemData(guid: guid,
                            title: title,
                            link: item.link,
                            description: item.description,
                            pubDate: pubDate,
                            imageUrl: item.enclosure?.url,
                            category: item.category ?? "",
                            hasRead: false)
    }
}
