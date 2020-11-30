//
//  DeleteTests.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 29.11.2020.
//

import XCTest
@testable import LocalizationHelper

final class DeleteTests: XCTestCase {
    
    private var deleting: Delete!
    private var encoding: EncodingMock!
    private var decoding: DecodingMock!
    private var outputting: OutputMock!
    
    override func setUp() {
        super.setUp()
        outputting = OutputMock()
        encoding = EncodingMock()
        decoding = DecodingMock()
        deleting = Delete(decoding: decoding, encoding: encoding, output: outputting)
    }
    
    override func tearDown() {
        deleting = nil
        encoding = nil
        decoding = nil
        outputting = nil
        super.tearDown()
    }
    
    func testDeleteWithKeyLanguage() throws {
        let key = "hello"
        let language = "ru"
        decoding.getDataResult = ["hello":["ru":"Привет"]]
        let results = deleting.deleting(key: key, language: language)
        XCTAssertNotNil(results)
        XCTAssertEqual(decoding.getDataCallsCount, 1)
        XCTAssertEqual(encoding.putDataCallsCount, 1)
        XCTAssertEqual(encoding.putDataParameters, ["hello":[:]])
        XCTAssertEqual(outputting.outputingKeyValueCallsCount, 1)
    }
    
    func testDeleteWithKey() throws {
        let key = "hello"
        decoding.getDataResult = ["hello":["ru":"Привет"]]
        let results = deleting.deleting(key: key, language: nil)
        XCTAssertNotNil(results)
        XCTAssertEqual(decoding.getDataCallsCount, 1)
        XCTAssertEqual(encoding.putDataCallsCount, 1)
        XCTAssertEqual(encoding.putDataParameters, [:])
        XCTAssertEqual(outputting.outputingKeyValueCallsCount, 1)
    }
    
    func testDeleteWithLanguage() throws {
        let language = "ru"
        decoding.getDataResult = ["hello":["ru":"Привет"]]
        let results = deleting.deleting(key: nil, language: language)
        XCTAssertNotNil(results)
        XCTAssertEqual(decoding.getDataCallsCount, 1)
        XCTAssertEqual(encoding.putDataCallsCount, 1)
        XCTAssertEqual(encoding.putDataParameters, ["hello":[:]])
        XCTAssertEqual(outputting.outputingKeyValueCallsCount, 1)
    }
    
    static var allTests = [
        ("testDeleteWithKeyAndLanguage", testDeleteWithKeyLanguage),
        ("testDeleteWithKey", testDeleteWithKey),
        ("testDeleteWithLanguage", testDeleteWithLanguage)
    ]
}


