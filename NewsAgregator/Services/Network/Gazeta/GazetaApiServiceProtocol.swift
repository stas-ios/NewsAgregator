//
//  GazetaApiServiceProtocol.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift

///Протокол сервиса получения новостей из источника gazeta.ru
protocol GazetaApiServiceProtocol: AnyObject {
    func requestRss() -> Single<RssDTO>
}
