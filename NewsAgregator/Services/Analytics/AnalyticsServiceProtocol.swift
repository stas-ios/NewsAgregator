//
//  AnalyticsServiceProtocol.swift
//  NewsAgregator
//
//  Created by Work on 06/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation

protocol AnalyticsServiceProtocol {
    func setup()
    func sendError(_ error: Error, additionalInfo: [String: Any]?)
}
