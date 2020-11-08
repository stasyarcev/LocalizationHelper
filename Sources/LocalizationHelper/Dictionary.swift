//
//  Dictionary.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 07.11.2020.
//

import Foundation

class Dictionary: DictionaryProtocol {
    
    let path: String
    init() {
        self.path = Bundle.main.path(forResource: "dictionary", ofType: "json") ?? "dictionary.json"
    }
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    func jsonDecoding() -> ([String : [String : String]]) {
        
        var dictionary: [String: [String: String]] = [:]
        if let jsonDictionary = FileManager.default.contents(atPath: path) {
            dictionary = (try? decoder.decode([String: [String: String]].self, from: jsonDictionary)) ?? [:]
        } else {
            dictionary = [:]
        }
        return dictionary
    }
    
    func jsonEncoding(dictionary: [String : [String : String]]) {
        do {
            encoder.outputFormatting = .prettyPrinted
            let json = (try encoder.encode(dictionary.self))
            guard let path = Bundle.main.url(forResource: "dictionary", withExtension: "json") else {
                return
            }
            try json.write(to: path.absoluteURL)
        } catch {
            print("Encoding didn't work")
        }
    }
}
