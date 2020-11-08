//
//  Search.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 07.11.2020.
//

import Foundation

class Search: SearchProtocol {
    
    let dict: Dictionary
    init() {
        self.dict = Dictionary()
    }
    
    func searching(key: String?, language: String?) {
        
        let dictionary = dict.jsonDecoding()
            // -k -l
        if let language: String = language, let key: String = key {
            for (keyDictionary, valuesDictionary) in dictionary {
                for (languageValue, wordValue) in valuesDictionary {
                    if keyDictionary.lowercased() == key.lowercased() {
                        if languageValue.lowercased() == language.lowercased() {
                            wordInDictionary.toggle()
                            print(wordValue.capitalizingFirstLetter())
                        }
                    }
                }
            }
            notFound(it: wordInDictionary)
            // -k
        } else if let key: String = key {
            for (keyDictionary, valuesDictionary) in dictionary {
                if keyDictionary.lowercased() == key.lowercased() {
                    wordInDictionary.toggle()
                    print(keyDictionary)
                    for (languageValue, wordValue) in valuesDictionary {
                        print("\(languageValue): \(wordValue.capitalizingFirstLetter())")
                    }
                }
            }
            notFound(it: wordInDictionary)
            // -l
        } else if let language: String = language {
            for (keyDictionary, valuesDictionary) in dictionary {
                for (languageValue, wordValue) in valuesDictionary {
                    if languageValue.lowercased() == language.lowercased() {
                        wordInDictionary.toggle()
                        print("\(keyDictionary): \(wordValue.capitalizingFirstLetter())")
                    }
                }
            }
            notFound(it: wordInDictionary)
            
        } else {
            for (keyDictionary, valuesDictionary) in dictionary {
                print(keyDictionary)
                for (languageValue, wordValue) in valuesDictionary {
                    print("\(languageValue): \(wordValue.capitalizingFirstLetter())")
                }
            }
        }
    }
}
