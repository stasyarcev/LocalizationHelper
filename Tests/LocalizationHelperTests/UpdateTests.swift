//
//  UpdateTests.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 30.11.2020.
//

import XCTest
@testable import LocalizationHelper

final class UpdateTest: XCTestCase {
    
    private var updating: Update!
    private var decoding: DecodingMock!
    private var searching: SearchMock!
    private var outputting: OutputMock!
    private var encoding: EncodingMock!
    
    override func setUp() {
        super.setUp()
        decoding = DecodingMock()
        outputting = OutputMock()
        searching = SearchMock()
        encoding = EncodingMock()
        updating = Update(decoding: decoding, encoding: encoding, output: outputting)
    }
    
    override func tearDown() {
        decoding = nil
        outputting = nil
        searching = nil
        encoding = nil
        updating = nil
        super.tearDown()
    }
    
    func testUpdateWord() throws {
        let word = "hola"
        let key = "hello"
        let language = "es"
        decoding.getDataResult = ["hola": ["hello":"es"]]
        let result = updating.updating(word: word, key: key, language: language)
        XCTAssertNotNil(result)
        XCTAssertEqual(decoding.getDataCallsCount, 1)
        XCTAssertEqual(encoding.putDataCallsCount, 1)
        XCTAssertEqual(encoding.putDataParameters, ["hola": ["hello":"es"]])
        XCTAssertEqual(outputting.outputingKeyValueCallsCount, 1)
        XCTAssertEqual(outputting.outputOneWordCallsCount, 1)
    }
    
    func testUpdateWithAnotherWord() throws {
        let word = "ciao"
        let key = "hello"
        let language = "it"
        decoding.getDataResult = ["hello": ["it":"cio"]]
        let result = updating.updating(word: word, key: key, language: language)
        XCTAssertNotNil(result)
        XCTAssertEqual(decoding.getDataCallsCount, 1)
        XCTAssertEqual(encoding.putDataCallsCount, 1)
        XCTAssertEqual(encoding.putDataParameters, ["cat": ["rom":"kot"]])
        XCTAssertEqual(outputting.outputOneWordCallsCount, 1)
        XCTAssertEqual(outputting.outputingKeyValueCallsCount, 1)
    }
    
    func testUpdateWithUncorrectWord() throws {
        let word = "ciao"
        let key = "hello"
        let language = "it"
        decoding.getDataResult = ["cat": ["rom":"kot"]]
        let result = updating.updating(word: word, key: key, language: language)
        XCTAssertNotNil(result)
        XCTAssertEqual(decoding.getDataCallsCount, 1)
        XCTAssertEqual(encoding.putDataCallsCount, 0)
        XCTAssertEqual(outputting.outputingKeyValueCallsCount, 0)
    }
    
    static var allTests = [
        ("testUpdateWithWord", testUpdateWord),
        ("testUpdateWithAnotherWord", testUpdateWithAnotherWord),
        ("testUpdateWithUncorrectWord", testUpdateWithUncorrectWord),
    ]
    
}
