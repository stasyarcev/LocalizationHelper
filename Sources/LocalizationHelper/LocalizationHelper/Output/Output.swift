//
//  Output.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 13.11.2020.
//

import Foundation

class Output: OutputProtocol {
    
    func output(word: String) {
        print(word)
    }
    
    func outputKeyValue(key: String, value: String) {
        print("\(key): \(value)")
    }
    
    func successFound(word inDictionary: Bool) {
        if inDictionary == false {
            print("Not Found")
        }
    }
}
