//
//  SettingsInteractor.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import Viper
import RxSwift

class SettingsInteractor: BaseInteractor, SettingsInteractorProtocol {
    //MARK: Dependencies
    @Injected private var categoryDBService: CategoryDBServiceProtocol!
    @Injected private var settingsDBService: SettingsDBServiceProtocol!
    
    //MARK: SettingsPresenterToInteractorProtocol
    func readSettings() -> Single<SettingsData> {
        return Single.zip(categoryDBService.readCategories(),
                          readTimeInterval())
            .map { (categories, timeInterval) in
                return SettingsData(
                    selectedCategoryCount: categories.filter({ $0.isSelected }).count,
                    totalCategoryCount: categories.count,
                    updateTimeInterval: timeInterval)
        }
    }
    
    //MARK: Private methods
    private func readTimeInterval() -> Single<UpdateTimeInterval> {
        return settingsDBService.readSettings()
            .map({ UpdateTimeInterval(rawValue: $0.updateTimeIntervalOption) })
            .forceUnwrap()
    }
    
}
