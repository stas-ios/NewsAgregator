//
//  NewsItemData.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

///Новость (Domain)
struct NewsItemData {
    enum Source: Int {
        case lenta
        case gazeta
    }
    //MARK: RSS
    let guid: String
    let title: String
    let link: String?
    let description: String?
    let pubDate: Date
    let imageUrl: String?
    let category: String
    
    ///Источник
    var source: Source?
    
    ///Пометка о прочтении
    var hasRead: Bool
    
    ///Пометка о показе новости в расширенном режиме (для NewsItemCell)
    var showDetails: Bool = false
}
