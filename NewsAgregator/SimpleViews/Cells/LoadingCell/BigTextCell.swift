//
//  LoadingCell.swift
//  NewsAgregator
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class BigTextCell: UITableViewCell, CellProtocol {
    //MARK: UI elements
    @IBOutlet private weak var label: UILabel!
    
    //MARK: Cell lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.separatorInset = UIEdgeInsets(top: 0.0,
                                           left: frame.width,
                                           bottom: 0.0,
                                           right: 0.0)
    }
    
    //MARK: CellProtocol
    func update(data: Any, indexPath: IndexPath) {
        label.text = data as? String
    }
    
    //MARK: Private methods
}
