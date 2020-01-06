//
//  LoadableImageInteractor.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import Kingfisher
import RxKingfisher
import RxSwift
import Viper

class LoadableImageInteractor: BaseInteractor, LoadableImageInteractorProtocol {
    //MARK: Dependencies
    @Injected private var kingfisher: KingfisherManager!
    
    //MARK: LoadableImagePresenterToInteractorProtocol
    func requestImage(url: String) -> Single<UIImage> {
        guard let url = URL(string: url) else {
            return Single<UIImage>.error(NSError())
        }
        return kingfisher.rx.retrieveImage(with: url)
    }
}
