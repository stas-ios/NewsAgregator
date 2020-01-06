//
//  KeyValueCell.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

///Ячейка с двумя лейблами. Только отображает данные
class KeyValueCell: UITableViewCell, CellProtocol {
    //MARK: UI elements
    @IBOutlet private weak var keyLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    //MARK: Cell lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK: CellProtocol
    func update(data: Any, indexPath: IndexPath) {
        guard let data = data as? KeyValueCellData else {
            assert(false)
            return
        }
        
        keyLabel.text = data.key
        valueLabel.text = data.value
    }
    
    //MARK: Private methods
}
