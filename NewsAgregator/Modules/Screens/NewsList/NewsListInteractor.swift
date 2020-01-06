//
//  NewsListInteractor.swift
//  NewsAgregator
//
//  Created by Work on 01/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import Foundation
import RxSwift
import Viper

class NewsListInteractor: BaseInteractor, NewsListInteractorProtocol {
    
    //MARK: Dependencies
    @Injected private var lentaApiService: LentaApiServiceProtocol!
    @Injected private var gazetaApiService: GazetaApiServiceProtocol!
    @Injected private var newsDBService: NewsDBServiceProtocol!
    @Injected private var settingsDBService: SettingsDBServiceProtocol!
    
    //MARK: NewsListPresenterToInteractorProtocol
    func requestNews() -> Single<[NewsItemData]> {
        //Получение новостей от сервера - ждём ответа от всех источников, и только потом показываем
        return Single.zip([
            lentaNewsRequest(),
            gazetaNewsRequest()
        ]).map({ results in
            var mergedArray = [NewsItemData]()
            results.map({ $0.items }).forEach { items in
                mergedArray.append(contentsOf: items)
            }
            guard mergedArray.count > 0 else {
                let error = results.first(where: { $0.error != nil })?.error ?? NewsScreenError.noNews
                throw error
            }
            return mergedArray
        }).map({ self.sort($0) })
    }
    
    func readNews() -> Single<[NewsItemData]> {
        //Чтение новостей из бд
        return newsDBService.readNewsItems()
            .map { $0.filter({ $0.category.isSelected }) }
            .map { DBToDomainNewsMapper.map($0) }
            .map({ self.sort($0) })
    }
    
    func save(newsItems: [NewsItemData]) -> Single<Bool> {
        //Сохранение массива новостей в бд
        let newsItemsDB = DomainToDBNewsMapper.map(newsItems)
        return newsDBService.save(newsItemsDB)
    }
    
    func markIsReading(_ newsItem: NewsItemData) -> Single<Bool> {
        //Сохранение в бд пометки новости, как прочитанной
        return newsDBService.markIsReading(guid: newsItem.guid, flag: newsItem.showDetails)
    }
    
    func readUpdateTimeInterval() -> Single<TimeInterval> {
        return settingsDBService.readSettings()
            .map({ UpdateTimeInterval(rawValue: $0.updateTimeIntervalOption) })
            .filter({ $0 != .never })
            .forceUnwrap()
            .map({ $0.timeInterval })
    }
    
    //MARK: Private methods
    private func lentaNewsRequest() -> Single<(items: [NewsItemData], error: Error?)> {
        return mappingRssResponse(lentaApiService.requestRss(), source: .lenta)
    }
    
    private func gazetaNewsRequest() -> Single<(items: [NewsItemData], error: Error?)> {
        return mappingRssResponse(gazetaApiService.requestRss(), source: .gazeta)
    }
    
    private func mappingRssResponse(_ request: Single<RssDTO>, source: NewsItemData.Source) -> Single<(items: [NewsItemData], error: Error?)> {
        return request.map {
            //маппинг сервисных объектов RssDTO в DomainData
            let items: [NewsItemData] = RSSToDomainNewsMapper.map($0)
                .map {
                    var data = $0
                    data.source = source
                    return data
            }
            return (items, nil)
        }.catchError { error in
            //В случае ошибки в одном из источников, остальные должны показываться. Поэтому в zip на вход идёт тупл ([NewsItemData], Error)
            .just(([], error))
        }
    }
    
    private func sort(_ newsItems: [NewsItemData]) -> [NewsItemData] {
        //Сортировка новостей по дате публикации от свежих к старым
        return newsItems.sorted { $0.pubDate > $1.pubDate }
    }
}
