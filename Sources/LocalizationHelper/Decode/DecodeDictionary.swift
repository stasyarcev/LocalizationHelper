//
//  DecodeDictionary.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 13.11.2020.
//

import Foundation

class DecodeDictionary: DecodeProtocol {
    
    let path: String
    let decoder = JSONDecoder()
    
    init() {
        self.path = Bundle.main.path(forResource: "dictionary", ofType: "json") ?? "dictionary.json"
    }
    
    func decoding() -> [String : [String : String]] {
        
        var dictionary: [String: [String: String]] = [:]
        
        if let jsonDictionary = FileManager.default.contents(atPath: path) {
            dictionary = (try? decoder.decode([String: [String: String]].self, from: jsonDictionary)) ?? [:]
        } else {
            dictionary = [:]
        }
        return dictionary
    }
}
