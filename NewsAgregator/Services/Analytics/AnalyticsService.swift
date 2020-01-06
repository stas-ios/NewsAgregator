//
//  AnalyticsService.swift
//  NewsAgregator
//
//  Created by Work on 06/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import Firebase
import Crashlytics

class AnalyticsService: AnalyticsServiceProtocol {
    @Persist(key: "kAnalyticsUserGUID", defaultValue: UUID().uuidString.lowercased())
    private var userGUID: String
    
    func setup() {
        FirebaseApp.configure()
        Crashlytics.sharedInstance().setUserIdentifier(userGUID)
    }
    
    func sendError(_ error: Error, additionalInfo: [String : Any]?) {
        Crashlytics.sharedInstance().recordError(error, withAdditionalUserInfo: additionalInfo)
    }
}
