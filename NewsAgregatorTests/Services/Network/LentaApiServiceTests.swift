//
//  LentaApiServiceTests.swift
//  NewsAgregatorTests
//
//  Created by Work on 05/01/2020.
//  Copyright © 2020 Work. All rights reserved.
//

import XCTest
@testable import NewsAgregator
import Swinject
import RxSwift

class LentaApiServiceTests: XCTestCase {
    private var lentaService: LentaApiService!
    private let httpServiceMock = HTTPWrapperServiceMock()
    private let disposeBag = DisposeBag()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Container.shared.register(HTTPWrapperServiceProtocol.self) { _ in
            HTTPWrapperServiceMock()
        }
        lentaService = LentaApiService()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRequestRss() {
        lentaService.requestRss()
            .subscribe(
                onSuccess: { [unowned self] rss in
                    self.checkInputParams()
                    self.checkResponse(rss)
            },
                onError: { _ in
                    XCTAssert(false)
            }).disposed(by: disposeBag)
    }
    
    func testError() {
        Container.shared.register(HTTPWrapperServiceProtocol.self) { _ in
            HTTPWrapperServiceMock(error: NetworkError.connectionError)
        }
        
        lentaService.requestRss()
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
    private func checkInputParams() {
        let params: HTTPWrapperServiceMock.InputParams! = httpServiceMock.inputParams
        XCTAssertNotNil(params)
        XCTAssertEqual(params.method, .get)
        XCTAssertEqual(params.url, "http://lenta.ru/rss")
    }
    
    private func checkResponse(_ rss: RssDTO) {
        XCTAssertEqual(rss, httpServiceMock.outputRss)
    }
}

