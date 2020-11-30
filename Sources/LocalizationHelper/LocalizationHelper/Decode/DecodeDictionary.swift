//
//  DecodeDictionary.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 13.11.2020.
//

import Foundation

class DecodeDictionary: DecodeProtocol {
    
    public func decoding() -> [String : [String : String]] {
        
        let path = Bundle.main.path(forResource: "dictionary", ofType: "json") ?? "dictionary.json"
        var dictionary: [String: [String: String]]
        let decoder = JSONDecoder()
        if let json = FileManager.default.contents(atPath: path) {
            dictionary = (try? decoder.decode([String: [String: String]].self, from: json)) ?? [:]
        } else {
            dictionary = [:]
        }
        return dictionary
    }
}
