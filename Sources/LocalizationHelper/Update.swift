//
//  Update.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 08.11.2020.
//

import Foundation

class Update: UpdateProtocol {
    
    let decode: DecodeProtocol
    let encode: EncodeProtocol
    let output: OutputProtocol
    
    init(decoding: DecodeProtocol, encoding: EncodeProtocol, output: OutputProtocol) {
        self.decode = decoding
        self.encode = encoding
        self.output = output
    }
    
    func updating(word: String, key: String, language: String) {
        
        var dictionary = decode.decoding()
        var newWord: [String: String] = dictionary[key] ?? [:]
        
        newWord[language] = word
        dictionary[key] = newWord
        guard let dict = dictionary[key] else {
            return
        }
        output.output(word: "add new word: \(word)\nresult: \(key): \(dict)")
        encode.encoding(dictionary: dictionary)
    }
}

//
/////Update word
//for (keyDictionary, valuesDictionary) in dictionary {
//    for (languageValue, wordValue) in valuesDictionary {
//        if let key: String = key,
//           let language: String = language,
//           language.lowercased() == languageValue.lowercased() &&
//           key.lowercased() == wordValue.lowercased()
//        {
//            inDictionary = true
//            dictionary[keyDictionary]?[languageValue] = word
//            dictionary.updateValue(valuesDictionary, forKey: languageValue)
//        }
//    }
//}
//
/////Add word
//if let newWord: String = word,
//   let language: String = language,
//   let key: String = key,
//   wordInDictionary == false
//{
//    emptyContainer[language] = key
//    dictionary[newWord]?[language] = key
//    dictionary.updateValue(emptyContainer, forKey: newWord)
//}
