//
//  XCTestManifest.swift
//  ArgumentParser
//
//  Created by Стас Ярцев on 30.11.2020.
//

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ArgumentsParserTests.allTests),
        testCase(DeleteTests.allTests),
        testCase(SearchTests.allTests),
        testCase(UpdateTests.allTests),
    ]
}
#endif
