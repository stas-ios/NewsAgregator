//
//  CheckmarkableCell.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

///Ячейка с галочкой. Толко отображает данные
class CheckmarkableCell: UITableViewCell, CellProtocol {
    //MARK: UI elements
    @IBOutlet private weak var label: UILabel!
    
    //MARK: Cell lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK: CellProtocol
    func update(data: Any, indexPath: IndexPath) {
        guard let data = data as? CheckmarkableCellData else {
            assert(false)
            return
        }
        
        label.text = data.value
        self.accessoryType = data.isSelected ? .checkmark : .none
    }
    
    //MARK: Private methods
}
