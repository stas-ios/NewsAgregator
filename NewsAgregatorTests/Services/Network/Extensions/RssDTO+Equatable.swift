//
//  RssDTO+Equatable.swift
//  NewsAgregatorTests
//
//  Created by Work on 06/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
@testable import NewsAgregator

extension RssDTO: Equatable {
    public static func == (lhs: RssDTO, rhs: RssDTO) -> Bool {
        return lhs.channel == rhs.channel
    }
}

extension RssChannelDTO: Equatable {
    public static func == (lhs: RssChannelDTO, rhs: RssChannelDTO) -> Bool {
        return lhs.item == rhs.item
    }
}

extension RssItemDTO: Equatable {
    public static func == (lhs: RssItemDTO, rhs: RssItemDTO) -> Bool {
        return lhs.guid == rhs.guid &&
            lhs.title == rhs.title &&
            lhs.author == rhs.author &&
            lhs.link == rhs.link &&
            lhs.description == rhs.description &&
            lhs.pubDate == rhs.pubDate &&
            lhs.enclosure == rhs.enclosure &&
            lhs.category == rhs.category
    }
}

extension RssEnclosureDTO: Equatable {
    public static func == (lhs: RssEnclosureDTO, rhs: RssEnclosureDTO) -> Bool {
        return lhs.url == rhs.url
    }
}
