//
//  EncodeDictionary.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 13.11.2020.
//

import Foundation

class EncodeDictionary: EncodeProtocol {
    
    func encoding(dictionary: [String: [String: String]]) {
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let json = (try? encoder.encode(dictionary))
        guard let path = Bundle.main.url(forResource: "dictionary", withExtension: "json") else {
            return
        }
        try? json?.write(to: path)
    }
}
