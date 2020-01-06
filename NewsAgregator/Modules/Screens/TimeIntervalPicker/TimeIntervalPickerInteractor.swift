//
//  TimeIntervalPickerInteractor.swift
//  NewsAgregator
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift
import Viper

class TimeIntervalPickerInteractor: BaseInteractor, TimeIntervalPickerInteractorProtocol {
    
    //MARK: Dependencies
    @Injected private var settingsDBService: SettingsDBServiceProtocol!
    
    //MARK: TimeIntervalPickerPresenterToInteractorProtocol
    func save(timeInterval: UpdateTimeInterval) -> Single<Bool> {
        return settingsDBService
            .save(timeIntervalOption: timeInterval.rawValue)
    }
    
    func readTimeInterval() -> Single<UpdateTimeInterval> {
        return settingsDBService
            .readSettings()
            .map({ UpdateTimeInterval(rawValue: $0.updateTimeIntervalOption) })
            .forceUnwrap()
    }
}
