//
//  CellFactoryProtocol.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit

///Протокол фабрики ячеек. Имплементируется в роутере
public protocol CellFactoryProtocol {
    /**
     Создаёт новую ячейку нужного типа (данные не передаёт - только создаёт)
     - parameters:
        - model: модель ячейки
     - returns: новая ячейка
     */
    func buildCell(model: CellModelProtocol) -> CellProtocol
}
