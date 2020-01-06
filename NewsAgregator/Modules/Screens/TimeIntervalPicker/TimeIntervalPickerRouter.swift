//
//  TimeIntervalPickerRouter.swift
//  NewsAgregator
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class TimeIntervalPickerRouter: BaseRouter<
    TimeIntervalPickerRouterToViewProtocol,
    TimeIntervalPickerRouterToPresenterProtocol
>, TimeIntervalPickerRouterProtocol {
    
    //MARK: Dependencies
    
    //MARK: Child module inputs
    
    //MARK: TimeIntervalPickerPresenterToRouterProtocol
    
    //MARK: CellFactoryProtocol
    func buildCell(model: CellModelProtocol) -> CellProtocol {
        switch model as! TimeIntervalPickerCells {
        case .checkmarkable:
            return CheckmarkableCell.loadFromNib()
        case .error:
            return ErrorCell.loadFromNib()
        }
    }
}

