//
//  LentaApiServiceProtocol.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift

///Протокол сервиса получения новостей из источника lenta.ru
protocol LentaApiServiceProtocol: AnyObject {
    func requestRss() -> Single<RssDTO>
}
