//
//  SettingsRouter.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class SettingsRouter: BaseRouter<
    SettingsRouterToViewProtocol,
    SettingsRouterToPresenterProtocol
>, SettingsRouterProtocol {
    
    //MARK: Dependencies
    
    //MARK: Child module inputs
    
    //MARK: SettingsPresenterToRouterProtocol
    
    //MARK: CellFactoryProtocol
    func buildCell(model: CellModelProtocol) -> CellProtocol {
        switch model as! SettingsCells {
        case .keyValue:
            return KeyValueCell.loadFromNib()
        case .error:
            return ErrorCell.loadFromNib()
        }
    }
}

