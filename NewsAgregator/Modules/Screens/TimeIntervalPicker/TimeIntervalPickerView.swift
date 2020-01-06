//
//  TimeIntervalPickerView.swift
//  NewsAgregator
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class TimeIntervalPickerView: BaseTableViewController<
    TimeIntervalPickerViewToPresenterProtocol
>, TimeIntervalPickerViewProtocol {
    
    //MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
    }
    
    //MARK: TimeIntervalPickerPresenterToViewProtocol
    
    //MARK: TimeIntervalPickerRouterToViewProtocol
}
