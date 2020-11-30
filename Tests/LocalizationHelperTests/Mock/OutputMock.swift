//
//  OutputMock.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 28.11.2020.
//


@testable import LocalizationHelper

class OutputMock: OutputProtocol {
    
    var outputOneWordParameters: (String)!
    var outputOneWordCallsCount = 0
    func output(word: String) {
        outputOneWordCallsCount += 1
        outputOneWordParameters = word
    }
    
    var outputingKeyValueParameters: ([String: String])!
    var outputingKeyValueCallsCount = 0
    func outputKeyValue(key: String, value: String) {
        outputingKeyValueCallsCount += 1
        outputingKeyValueParameters = ([key: value])
    }
    
    var successFoundParameters: (Bool)!
    var successFoundCallsCount = 0
    func successFound(word inDictionary: Bool) {
        successFoundCallsCount += 1
        successFoundParameters = inDictionary
    }
}
