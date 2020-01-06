//
//  NewsItemDBDTO.swift
//  NewsAgregator
//
//  Created by Work on 03/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

struct NewsItemDBDTO {
    let guid: String
    let title: String
    let link: String?
    let descr: String?
    let pubDate: Date
    let imageUrl: String?
    let category: CategoryDBDTO
    let source: Int
    let hasRead: Bool
    let isReading: Bool
}
