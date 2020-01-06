//
//  UIView+loadFromNib.swift
//  NewsAgregator
//
//  Created by Work on 03/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit

extension UIView {
    /**
      Загружает view из xib-файла. Название xib-файла должно совпадать с названием класса. Объект должен быть первым в xib-е.
     - returns: загруженное view
     */
    static func loadFromNib() -> Self {
        let bundle = Bundle(for: Self.self)
        let nibName = String(describing: Self.self)
        return bundle.loadNibNamed(nibName, owner: self, options: nil)!.first as! Self
    }
}
