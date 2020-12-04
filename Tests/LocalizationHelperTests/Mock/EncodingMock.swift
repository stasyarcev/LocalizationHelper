//
//  EncodingMock.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 28.11.2020.
//

@testable import LocalizationHelper

class EncodingMock: EncodeProtocol {
    
    var putDataParameters: ([String : [String : String]])!
    var putDataCallsCount = 0
    func encoding(dictionary: [String : [String : String]]) {
        putDataCallsCount += 1
        putDataParameters = dictionary
    }
}
