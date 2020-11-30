//
//  DecodingMock.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 28.11.2020.
//

@testable import LocalizationHelper

class DecodingMock: DecodeProtocol {
    
    var getDataParameters: ()!
    var getDataResult: [String: [String: String]] = [:]
    var getDataCallsCount = 0
    func decoding() -> [String : [String : String]] {
        getDataCallsCount += 1
        getDataParameters = ()
        return getDataResult
    }
}
