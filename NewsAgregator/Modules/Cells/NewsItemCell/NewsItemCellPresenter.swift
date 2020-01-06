//
//  NewsItemCellPresenter.swift
//  NewsAgregator
//
//  Created by Work on 02/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import Viper

class NewsItemCellPresenter: BasePresenter<
    NewsItemCellPresenterToViewProtocol,
    NewsItemCellPresenterToInteractorProtocol,
    NewsItemCellPresenterToRouterProtocol,
    NewsItemCellOutputProtocol
>, NewsItemCellPresenterProtocol {
    //MARK: Dependencies
    @Injected("readable") private var dateFormatter: DateFormatter!
    
    private var indexPath: IndexPath?
    
    //MARK: NewsItemCellInputProtocol
    func setup() {
        router.attachLoadableImage()
    }
    
    func prepareForReuse() {
        view.display(title: "")
        view.display(date: "")
        view.display(source: "")
        view.display(description: "")
        view.display(fullMode: false)
        router.resetLoadableImage()
    }
    
    func present(_ data: Any, indexPath: IndexPath) {
        guard let data = data as? NewsItemData else {
            assert(false)
            return
        }
        
        self.indexPath = indexPath
        
        view.display(title: data.title)
        view.display(date: dateFormatter.string(from: data.pubDate))
        view.display(source: getSourceText(source: data.source))
        view.display(description: data.description ?? "")
        view.display(fullMode: data.showDetails)
        view.display(hasRead: data.hasRead)
        
        router.loadImage(url: data.imageUrl)
    }
    
    //MARK: NewsItemCellViewToPresenterProtocol
    
    //MARK: LoadableImageOutputProtocol
    
    //MARK: Private methods
    private func getSourceText(source: NewsItemData.Source?) -> String {
        guard let source = source else {
            return ""
        }
        
        var srcText = "Источник: "
        switch source {
        case .lenta:
            srcText += "lenta.ru"
            break
        case .gazeta:
            srcText += "gazeta.ru"
            break
        }
        return srcText
    }
}
