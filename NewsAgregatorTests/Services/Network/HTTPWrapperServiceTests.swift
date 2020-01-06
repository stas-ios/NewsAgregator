//
//  HTTPWrapperServiceTests.swift
//  NewsAgregatorTests
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import XCTest
@testable import NewsAgregator
import Swinject
import XMLCoder
import RxSwift

struct FakeParameters: Encodable {
    let first: Int
    let second: String
    let third: Double
}

struct FakeHeaders: Encodable {
    let header: String
    let anotherHeader: String
}

class HTTPWrapperServiceTests: XCTestCase {
    //MARK: Setup
    private var httpWrapperService: HTTPWrapperService!
    private let networkingServiceMock = NetworkingServiceMock(filename: "rss.xml")
    private let disposeBag = DisposeBag()
    
    private let url = "https://kazan.hh.ru/"
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Container.shared.register(NetworkingServiceProtocol.self) { [unowned self] _ in
            self.networkingServiceMock
        }
        Container.shared.register(JSONEncoder.self) { _ in JSONEncoder() }
        
        let decoder = XMLDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, dd MMM yyyy HH:mm:ss Z"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        httpWrapperService = HTTPWrapperService(decoder: decoder)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: Tests
    
    //Запрос с параметрами и хедерами
    func testRequestWithParametersAndHeaders() {
        let parameters = FakeParameters(first: 11,
                                        second: "Something",
                                        third: 18.44)
        let headers = FakeHeaders(header: "head",
                                  anotherHeader: "head2")
        
        httpWrapperService.request(method: HTTPMethod.post,
                                   url: url,
                                   parameters: parameters,
                                   headers: headers)
            .subscribe(onSuccess: { [unowned self] (response: RssDTO) in
                //Тестируем запрос, пришедший в NetworkingService
                let netInput: NetworkingServiceMock.InputParams! = self.networkingServiceMock.inputParams
                
                self.checkNetInputMethodAndUrl(netInput: netInput)
                self.checkParams(netInputParams: netInput.parameters, parameters: parameters)
                self.checkHeaders(netInputHeaders: netInput.headers, headers: headers)
                self.checkResponse(response)
            }, onError: { _ in
                XCTAssert(false)
            }).disposed(by: disposeBag)
    }
    
    //Запрос с параметрами без хедеров
    func testRequestWithParameters() {
        let parameters = FakeParameters(first: 11,
                                        second: "Something",
                                        third: 18.44)
        
        httpWrapperService.request(method: HTTPMethod.post,
                                   url: url,
                                   parameters: parameters)
            .subscribe(onSuccess: { [unowned self] (response: RssDTO) in
                //Тестируем запрос, пришедший в NetworkingService
                let netInput: NetworkingServiceMock.InputParams! = self.networkingServiceMock.inputParams
                
                self.checkNetInputMethodAndUrl(netInput: netInput)
                self.checkParams(netInputParams: netInput.parameters, parameters: parameters)
                XCTAssertNil(netInput.headers)
                self.checkResponse(response)
            }, onError: { _ in
                XCTAssert(false)
            }).disposed(by: disposeBag)
    }
    
    //Запрос с хедерами без параметров
    func testRequestWithHeaders() {
        let headers = FakeHeaders(header: "head",
                                  anotherHeader: "head2")
        
        httpWrapperService.request(method: HTTPMethod.post,
                                   url: url,
                                   headers: headers)
            .subscribe(onSuccess: { [unowned self] (response: RssDTO) in
                //Тестируем запрос, пришедший в NetworkingService
                let netInput: NetworkingServiceMock.InputParams! = self.networkingServiceMock.inputParams
                
                self.checkNetInputMethodAndUrl(netInput: netInput)
                XCTAssertNil(netInput.parameters)
                self.checkHeaders(netInputHeaders: netInput.headers, headers: headers)
                self.checkResponse(response)
            }, onError: { _ in
                XCTAssert(false)
            }).disposed(by: disposeBag)
    }
    
    //Запрос без параметров и хедеров
    func testEmptyRequest() {
        httpWrapperService.request(method: HTTPMethod.post,
                                   url: url)
            .subscribe(onSuccess: { [unowned self] (response: RssDTO) in
                //Тестируем запрос, пришедший в NetworkingService
                let netInput: NetworkingServiceMock.InputParams! = self.networkingServiceMock.inputParams
                
                self.checkNetInputMethodAndUrl(netInput: netInput)
                XCTAssertNil(netInput.parameters)
                XCTAssertNil(netInput.headers)
                self.checkResponse(response)
            }, onError: { _ in
                XCTAssert(false)
            }).disposed(by: disposeBag)
    }
    
    func testError() {
        //Проверка преобразования ошибок NSURLErrorDomain в NetworkError
        networkingServiceMock.error = NSError(domain: NSURLErrorDomain,
                                              code: NSURLErrorNetworkConnectionLost,
                                              userInfo: nil)
        
        httpWrapperService.request(method: HTTPMethod.post,
                                   url: url)
            .subscribe(
                onSuccess: { (response: RssDTO) in
                    XCTAssert(false)
                }, onError: { error in
                    let error = error as? NetworkError
                    XCTAssertNotNil(error)
                    switch error {
                    case .connectionError:
                        break
                    default:
                        XCTAssert(false)
                    }
            }).disposed(by: disposeBag)
    }
    
    //MARK: Private checkers
    
    private func checkNetInputMethodAndUrl(netInput: NetworkingServiceMock.InputParams!) {
        //Проверяем, что правильные метод и url
        XCTAssertNotNil(netInput)
        XCTAssertEqual(netInput.method, .post)
        XCTAssertEqual(netInput.url, url)
    }
    
    private func checkParams(netInputParams: [String: Any]!, parameters: FakeParameters) {
        //Проверяем, что параметры уходят правильно
        XCTAssertNotNil(netInputParams)
        XCTAssertEqual(netInputParams.count, 3)
        XCTAssertEqual(netInputParams["first"] as? Int, parameters.first)
        XCTAssertEqual(netInputParams["second"] as? String, parameters.second)
        XCTAssertEqual(netInputParams["third"] as? Double, parameters.third)
    }
    
    private func checkHeaders(netInputHeaders: [String: String]!, headers: FakeHeaders) {
        //Проверяем, что хедеры уходят правильно
        XCTAssertNotNil(netInputHeaders)
        XCTAssertEqual(netInputHeaders.count, 2)
        XCTAssertEqual(netInputHeaders["header"], headers.header)
        XCTAssertEqual(netInputHeaders["anotherHeader"], headers.anotherHeader)
    }

    private func checkResponse(_ response: RssDTO) {
        //Проверяем парсинг ответа
        XCTAssertEqual(response.channel?.item?.count, 3)
        let item = response.channel!.item![1]
        XCTAssertEqual(item.guid, "https://lenta.ru/news/2020/01/05/bolshunov/")
        XCTAssertEqual(item.title, "Россиянин Большунов выиграл гонку «Тур де Ски»")
        XCTAssertNil(item.author)
        XCTAssertEqual(item.link, "https://lenta.ru/news/2020/01/05/bolshunov/")
        XCTAssertNotNil(item.pubDate)
        XCTAssertEqual(item.enclosure?.url, "https://icdn.lenta.ru/images/2020/01/05/18/20200105181006765/pic_861f36a85a16b4d4d1426e2cb096becc.jpg")
        XCTAssertEqual(item.category, "Спорт")
    }
}
