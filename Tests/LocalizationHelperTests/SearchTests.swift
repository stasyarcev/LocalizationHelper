//
//  SearchTests.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 29.11.2020.
//

import XCTest
@testable import LocalizationHelper

final class SearchTest: XCTestCase {
    
    private var searching: Search!
    private var decoding: DecodingMock!
    private var outputting: OutputMock!
    
    override func setUp() {
        super.setUp()
        decoding = DecodingMock()
        outputting = OutputMock()
        searching = Search(decoding: decoding, output: outputting)
    }
    
    override func tearDown() {
        decoding = nil
        outputting = nil
        super.tearDown()
    }
    
    func testSearchWithKeyLanguage() throws {
        let key = "hello"
        let language = "ru"
        decoding.getDataResult = ["hello": ["ru":"Привет"]]
        let results = searching.searching(key: key, language: language)
        XCTAssertNotNil(results)
        XCTAssertEqual(decoding.getDataCallsCount, 1)
        XCTAssertEqual(outputting.outputingKeyValueCallsCount, 1)
        XCTAssertEqual(outputting.outputOneWordParameters, "Привет")
    }
    
    func testSearchWithKey() throws {
            let key = "hello"
            decoding.getDataResult = ["hello": ["ru":"Привет"]]
            let results = searching.searching(key: key, language: nil)
            XCTAssertNotNil(results)
            XCTAssertEqual(decoding.getDataCallsCount, 1)
            XCTAssertEqual(outputting.outputOneWordCallsCount, 1)
            XCTAssertEqual(outputting.outputOneWordParameters, "hello")
            XCTAssertEqual(outputting.outputingKeyValueCallsCount, 1)
            XCTAssertEqual(outputting.outputingKeyValueParameters, ["ru":"Привет"])

    }
    
    func testSearchWithLanguage() throws {
        let language = "ru"
        decoding.getDataResult = ["hello": ["ru":"Привет"]]
        let results = searching.searching(key: nil, language: language)
        XCTAssertNotNil(results)
        XCTAssertEqual(decoding.getDataCallsCount, 1)
        XCTAssertEqual(outputting.outputingKeyValueCallsCount, 1)
    }
    
    func testSearchWithoutArguments() throws {
        decoding.getDataResult = ["hello": ["ru":"Привет"]]
        let results = searching.searching(key: nil, language: nil)
        XCTAssertNotNil(results)
        XCTAssertEqual(decoding.getDataCallsCount, 1)
        XCTAssertEqual(outputting.outputOneWordCallsCount, 1)
    }
    
    func testSearchWithUncorrectKeyAndLanguage() throws {
        let key = "hiloo"
        let language = "yu"
        decoding.getDataResult = ["hello": ["ru":"Привет"]]
        let results = searching.searching(key: key, language: language)
        XCTAssertNotNil(results)
        XCTAssertEqual(decoding.getDataCallsCount, 1)
        XCTAssertEqual(outputting.outputingKeyValueCallsCount, 1)
        XCTAssertEqual(outputting.outputOneWordParameters, "Not found")
    }
    
    func testSearchWithUncorrectKey() throws {
        let key = "hi"
        decoding.getDataResult = ["hello": ["ru":"Привет"]]
        let results = searching.searching(key: key, language: nil)
        XCTAssertNotNil(results)
        XCTAssertEqual(decoding.getDataCallsCount, 1)
        XCTAssertEqual(outputting.outputOneWordCallsCount, 1)
        XCTAssertEqual(outputting.outputOneWordParameters, "Not found")
        XCTAssertEqual(outputting.outputOneWordCallsCount, 0)
    }

    func testSearchWithUncorrectLanguage() throws {
        let language = "en"
        decoding.getDataResult = ["hello": ["ru":"Привет"]]
        let results = searching.searching(key: nil, language: language)
        XCTAssertNotNil(results)
        XCTAssertEqual(decoding.getDataCallsCount, 1)
        XCTAssertEqual(outputting.outputOneWordCallsCount, 1)
        XCTAssertEqual(outputting.outputOneWordParameters, "Not found")
        XCTAssertEqual(outputting.outputOneWordCallsCount, 0)
    }
    
    static var allTests = [
        ("testSearchWithKeyLanguage", testSearchWithKeyLanguage),
        ("testSearchWithKey", testSearchWithKey),
        ("testSearchWithLanguage", testSearchWithLanguage),
        ("testSearchWithoutArguments", testSearchWithoutArguments),
        ("testSearchWithUncorrectKeyAndLanguage", testSearchWithUncorrectKeyAndLanguage),
        ("testSearchWithUncorrectKey", testSearchWithUncorrectKey),
        ("testSearchWithUncorrectLanguage", testSearchWithUncorrectLanguage),
    ]
}
