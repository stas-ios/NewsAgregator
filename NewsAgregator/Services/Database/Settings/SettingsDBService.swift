//
//  SettingsDBService.swift
//  NewsAgregator
//
//  Created by Work on 04/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

class SettingsDBService: SettingsDBServiceProtocol {
    @Injected private var databaseService: DatabaseServiceProtocol!
    
    private let globalSettingsGuid = "global"
    private var defaultSettings: SettingsDBDTO {
        SettingsDBDTO(
            guid: globalSettingsGuid,
            updateTimeIntervalOption: UpdateTimeInterval.oneMinute.rawValue
        )
    }
    
    func readSettings() -> Single<SettingsDBDTO> {
        let settingsRealm: Single<SettingsRealmObject?> = databaseService.object(primaryKey: globalSettingsGuid)
        return settingsRealm
            .map({ [weak self] in
                guard let `self` = self else { throw NSError() }
                return RealmToDBSettingsMapper.map($0) ?? self.defaultSettings
            })
            //В случае ошибки бд (крайне маловероятной) приложение продолжит работать с настройками по умолчанию
            .catchErrorJustReturn(self.defaultSettings)
            //до этого момента работали с Realm-объектами, которые должны использоваться в том же потоке, где читались
            .observeOn(MainScheduler.instance)
    }
    
    func save(timeIntervalOption: Int) -> Single<Bool> {
        return databaseService.write { [weak self] realm in
            guard let `self` = self else { throw NSError() }
            let object = self.getOrCreateSettings(realm: realm,
                                                  guid: self.globalSettingsGuid)
            object.updateTimeIntervalOption = timeIntervalOption
            realm.add(object, update: .all)
        }
    }
    
    //MARK: Private methods
    private func getOrCreateSettings(realm: RealmProtocol, guid: String) -> SettingsRealmObject {
        if let object = realm.object(ofType: SettingsRealmObject.self,
                                     forPrimaryKey: guid) {
            return object
        }
        let object = SettingsRealmObject()
        object.guid = guid
        return object
    }
}
