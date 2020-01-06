//
//  ErrorCell.swift
//  NewsAgregator
//
//  Created by Work on 03/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class ErrorCell: UITableViewCell, CellProtocol {
    @IBOutlet private weak var label: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK: CellProtocol
    func update(data: Any, indexPath: IndexPath) {
        guard let data = data as? String else {
            assert(false)
            return
        }
        label.text = data
    }
    
    func didSelect() {
        
    }
    
    //MARK: Private methods
}
