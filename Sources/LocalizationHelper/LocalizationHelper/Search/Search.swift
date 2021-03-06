//
//  Search.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 07.11.2020.
//

import Foundation

class Search: SearchProtocol {
    
    let decode: DecodeProtocol
    let terminal: OutputProtocol
    var wordInDictionary: Bool
    
    init(decoding: DecodeProtocol, output: OutputProtocol) {
        self.decode = decoding
        self.terminal = output
        self.wordInDictionary = false
    }
    
    func searching(key: String?, language: String?) -> SearchResults <SearchSuccess, SearchError> {
        
        let dictionary = decode.decoding()
        
        if key == nil && language == nil {
            print(dictionary)
            for (keyDictionary, valuesDictionary) in dictionary {
                wordInDictionary = true
                terminal.output(word: keyDictionary)
                for (languageValue, wordValue) in valuesDictionary {
                    terminal.outputKeyValue(key: languageValue, value: wordValue.capitalizingFirstLetter())
                }
            }
            return .success(.searchingSuccess)
        } else if let language: String = language, let key: String = key {
            for (keyDictionary, valuesDictionary) in dictionary {
                for (languageValue, wordValue) in valuesDictionary {
                    if keyDictionary.lowercased() == key.lowercased() {
                        if languageValue.lowercased() == language.lowercased() {
                            wordInDictionary = true
                            terminal.output(word: wordValue.capitalizingFirstLetter())
                        }
                    }
                }
            }
            return .success(.searchingSuccess)
        } else if let key: String = key {
            for (keyDictionary, valuesDictionary) in dictionary {
                if keyDictionary.lowercased() == key.lowercased() {
                    wordInDictionary = true
                    terminal.output(word: keyDictionary)
                    for (languageValue, wordValue) in valuesDictionary {
                        terminal.outputKeyValue(key: languageValue, value: wordValue.capitalizingFirstLetter())
                    }
                }
            }
            return .success(.searchingSuccess)
        } else if let language: String = language {
            for (keyDictionary, valuesDictionary) in dictionary {
                for (languageValue, wordValue) in valuesDictionary {
                    if languageValue.lowercased() == language.lowercased() {
                        wordInDictionary = true
                        terminal.outputKeyValue(key: keyDictionary, value: wordValue.capitalizingFirstLetter())
                    }
                }
            }
            return .success(.searchingSuccess)
        } else {
            terminal.successFound(word: false)
            return .failure(.notFound)
        }
    }
}
