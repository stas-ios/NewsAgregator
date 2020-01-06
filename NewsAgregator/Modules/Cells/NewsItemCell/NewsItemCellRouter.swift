//
//  NewsItemCellRouter.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import UIKit
import Viper

class NewsItemCellRouter: BaseRouter<
    NewsItemCellRouterToViewProtocol,
    NewsItemCellRouterToPresenterProtocol
>, NewsItemCellRouterProtocol {
    
    //MARK: Dependencies
    
    //MARK: Child module inputs
    private weak var loadableImage: LoadableImageInputProtocol?
    
    //MARK: NewsItemCellPresenterToRouterProtocol
    func attachLoadableImage() {
        let component: LoadableImageComponentProtocol = moduleFactory.component(ofType: LoadableImageComponent.self, output: presenter)
        loadableImage = component.input
        view.addLoadableImage(component.view)
    }
    
    func loadImage(url: String?) {
        loadableImage?.present(imageUrl: url)
    }
    
    func resetLoadableImage() {
        loadableImage?.reset()
    }
}

