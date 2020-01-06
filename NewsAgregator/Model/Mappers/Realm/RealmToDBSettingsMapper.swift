//
//  RealmToDBSettingsMapper.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

class RealmToDBSettingsMapper: Mapper {
    static func map(_ source: SettingsRealmObject) -> SettingsDBDTO {
        return SettingsDBDTO(guid: source.guid,
                             updateTimeIntervalOption: source.updateTimeIntervalOption)
    }
}
