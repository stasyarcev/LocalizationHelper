//
//  Update.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 08.11.2020.
//

import Foundation

class Update: UpdateProtocol {
    
    var dict: Dictionary
    init() {
        self.dict = Dictionary()
    }
    
    func updating(word: String?, key: String?, language: String?) {
        
        var dictionary = dict.jsonDecoding()
        var emptyContainer: [String: String] = [:]
        
        ///Update word
        for (keyDictionary, valuesDictionary) in dictionary {
            for (languageValue, wordValue) in valuesDictionary {
                if let key: String = key,
                   let language: String = language,
                   language.lowercased() == languageValue.lowercased() &&
                   key.lowercased() == wordValue.lowercased() {
                    wordInDictionary.toggle()
                    dictionary[keyDictionary]?[languageValue] = word
                    dictionary.updateValue(valuesDictionary, forKey: languageValue)
                }
            }
        }
        
        ///Add word
        if let newWord:String = word,
           let language: String = language,
           let key: String = key,
           wordInDictionary == false {
            emptyContainer[language] = key
            dictionary[newWord]?[language] = key
            dictionary.updateValue(emptyContainer, forKey: newWord)
        }
        dict.jsonEncoding(dictionary: dictionary)
    }
}
