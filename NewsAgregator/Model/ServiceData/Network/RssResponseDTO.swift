//
//  LentaNewsResponseItemDTO.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

//Ответ сервера RSS

struct RssDTO: Decodable {
    let channel: RssChannelDTO?
}

struct RssChannelDTO: Decodable {
    let item: [RssItemDTO]?
}

struct RssItemDTO: Decodable {
    let guid: String?
    let title: String?
    let author: String?
    let link: String?
    let description: String?
    let pubDate: Date?
    let enclosure: RssEnclosureDTO?
    let category: String?
}

struct RssEnclosureDTO: Decodable {
    let url: String?
}
