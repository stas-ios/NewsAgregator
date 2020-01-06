//
//  CellProtocol.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit

/**
 Протокол ячейки, используемый для работы с TableDataSource.
 Должен быть имплементирован как в VIPER-ячейках (во view), так и в простых ячейках.
*/
public protocol CellProtocol: UITableViewCell {
    func update(data: Any, indexPath: IndexPath)
}
