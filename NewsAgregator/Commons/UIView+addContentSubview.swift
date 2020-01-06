//
//  UIView+addContentSubview.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit

extension UIView {
    /**
     Добавляет subview в точности по фрейму родительского UIView.
     - parameters:
        - subview: view для добавления
     */
    func addContentSubview(_ subview: UIView) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            NSLayoutConstraint(item: self,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: subview,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self,
                               attribute: .left,
                               relatedBy: .equal,
                               toItem: subview,
                               attribute: .left,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self,
                               attribute: .right,
                               relatedBy: .equal,
                               toItem: subview,
                               attribute: .right,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: self,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: subview,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0.0)
        ])
    }
}
