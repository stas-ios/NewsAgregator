//
//  NewsDBServiceTests.swift
//  NewsAgregatorTests
//
//  Created by Work on 06/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import XCTest
@testable import NewsAgregator
import Swinject
import RxSwift

class NewsDBServiceTests: XCTestCase {
    private var dbServiceMock: DatabaseServiceMock!
    private let newsDBService = NewsDBService()
    private let disposeBag = DisposeBag()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Container.shared.register(DatabaseServiceProtocol.self) { [unowned self] _ in
            self.dbServiceMock = DatabaseServiceMock(categoryCount: 5,
                                                     newsItemCount: 20)
            self.dbServiceMock.setup()
            return self.dbServiceMock
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReadNewsItems() {
        newsDBService.readNewsItems()
            .subscribe(
                onSuccess: { [unowned self] newsItems in
                    XCTAssert(newsItems.count == self.dbServiceMock.realmMock.newsItems.count)
                    for i in 0..<newsItems.count {
                        let lhs = newsItems[i]
                        let rhs = self.dbServiceMock.realmMock.newsItems[i]
                        self.checkEqual(dbdto: lhs, realmObject: rhs)
                        XCTAssertEqual(lhs.hasRead, rhs.hasRead)
                    }
            },
                onError: { _ in
                    XCTAssert(false)
            }).disposed(by: disposeBag)
    }

    func testSaveNewNews() {
        let item = NewsItemDBDTO(guid: "my_guid",
                                     title: "my_title",
                                     link: "my_link",
                                     descr: "my_descr",
                                     pubDate: Date(),
                                     imageUrl: "my_imageUrl",
                                     category: CategoryDBDTO(name: "my_category",
                                                             isSelected: false),
                                     source: 0,
                                     hasRead: false)
        newsDBService.save([item])
            .subscribe(
                onSuccess: { [unowned self] _ in
                //Проверяем, что новая новость создалась
                    let newsItem: NewsItemRealmObject! = self.dbServiceMock.realmMock.newsItems.first(where: { $0.guid == item.guid })
                    XCTAssertNotNil(newsItem)
                    self.checkEqual(dbdto: item, realmObject: newsItem)
                //Проверяем, что новая категория создалась и привязалась к новости
                    let category = self.dbServiceMock.realmMock.categories.first(where: { $0.name == item.category.name })
                    XCTAssertNotNil(category)
                    XCTAssertEqual(newsItem.category.name, item.category.name)
                    //по умолчанию новые категории выбраны в фильтрах
                    XCTAssertEqual(newsItem.category.selected, true)
            },
                onError: { _ in
                    XCTAssert(false)
            }).disposed(by: disposeBag)
    }
    
    func testSaveOldNews() {
        let item = NewsItemDBDTO(guid: "NewsGuid_0",
                                 title: "my_title",
                                 link: "my_link",
                                 descr: "my_descr",
                                 pubDate: Date(),
                                 imageUrl: "my_imageUrl",
                                 category: CategoryDBDTO(name: "my_category",
                                                         isSelected: false),
                                 source: 0,
                                 hasRead: false)
        newsDBService.save([item])
            .subscribe(
                onSuccess: { [unowned self] _ in
                //Проверяем, что записываемая новость перезаписала старую, а не продублировала (что guid - действительно primary key)
                    XCTAssertEqual(self.dbServiceMock.realmMock.newsItems.filter({ $0.guid == item.guid }).count, 1)
                    
                    //проверяем, что перезаписались измененные поля
                    let newsItem: NewsItemRealmObject! = self.dbServiceMock.realmMock.newsItems.first(where: { $0.guid == item.guid })
                    XCTAssertNotNil(newsItem)
                    self.checkEqual(dbdto: item, realmObject: newsItem)
                    //проверяем, что не стёрлась пометка о прочтении
                    XCTAssertEqual(newsItem.hasRead, true)
            },
                onError: { _ in
                    XCTAssert(false)
            }).disposed(by: disposeBag)
    }
    
    private func checkEqual(dbdto: NewsItemDBDTO, realmObject: NewsItemRealmObject) {
        XCTAssertEqual(dbdto.guid, realmObject.guid)
        XCTAssertEqual(dbdto.title, realmObject.title)
        XCTAssertEqual(dbdto.link, realmObject.link)
        XCTAssertEqual(dbdto.descr, realmObject.descr)
        XCTAssertEqual(dbdto.pubDate, realmObject.pubDate)
        XCTAssertEqual(dbdto.imageUrl, realmObject.imageUrl)
        XCTAssertEqual(dbdto.category.name, realmObject.category.name)
        XCTAssertEqual(dbdto.source, realmObject.source)
    }
}
