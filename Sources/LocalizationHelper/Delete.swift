//
//  Delete.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 07.11.2020.
//

import Foundation

class Delete: DeleteProtocol {
    
    func deleting(key: String?, language: String?) {
        let dict = Dictionary()
        var dictionary = dict.jsonDecoding()
        
        for (keyDictionary, valuesDictionary) in dictionary {
            for (languageValue, wordValue) in valuesDictionary {
                // -k -l
                if key == wordValue && language == languageValue  {
                    dictionary.removeValue(forKey: keyDictionary)
                }
                // -k || -l
                else if key == wordValue || language == languageValue {
                    dictionary[keyDictionary]?[languageValue] = nil
                }
            }
        }
        dict.jsonEncoding(dictionary: dictionary)
    }
}
