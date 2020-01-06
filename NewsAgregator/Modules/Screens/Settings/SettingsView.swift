//
//  SettingsView.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class SettingsView: BaseTableViewController<
    SettingsViewToPresenterProtocol
>, SettingsViewProtocol {
    
    //MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.willAppear()
    }
    
    //MARK: SettingsPresenterToViewProtocol
    
    //MARK: SettingsRouterToViewProtocol
    
    //MARK: Private methods
}
