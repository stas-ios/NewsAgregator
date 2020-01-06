//
//  CategoryData.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

///Категория новостей
struct CategoryData {
    ///Название категории
    let name: String
    
    ///true, если выбрана галочка в настройках фильтров (по умолчанию все)
    var isSelected: Bool
}
