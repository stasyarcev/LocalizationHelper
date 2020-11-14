//
//  Delete.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 07.11.2020.
//

import Foundation

class Delete: DeleteProtocol {
    
    let decode: DecodeProtocol
    let encode: EncodeProtocol
    let output: OutputProtocol
    
    init(decoding: DecodeProtocol, encoding: EncodeProtocol, output: OutputProtocol) {
        self.decode = decoding
        self.encode = encoding
        self.output = output
    }
    
    //delete -l
    fileprivate func delL(lang: String, dictionary: [String: [String: String]]) -> [String: [String: String]] {
        
        var dictionary = dictionary
        
        for (keyDictionary, valuesDictionary) in dictionary {
            var values = valuesDictionary
            values[lang] = nil
            dictionary[keyDictionary] = values
        }
        return dictionary
    }

    //delete -k
    fileprivate func delK(key: String, dictionary: [String: [String: String]]) -> [String: [String: String]] {
        
        var dictionary = dictionary
        
        dictionary[key] = nil
        return dictionary
    }

    //delete -k -l
    fileprivate func delKL(key: String, lang: String, dictionary: [String: [String: String]]) -> [String: [String: String]] {
        
        var dictionary = dictionary
        
        var values = dictionary[key] ?? [:]
        values[lang] = nil
        dictionary[key] = values
        return dictionary
    }
    
    func deleting(key: String?, language: String?) {
        
        var dictionary = decode.decoding()
        
        if let key = key, let langauge = language {
            dictionary = delKL(key: key, lang: langauge, dictionary: dictionary)
        } else if let key = key {
            dictionary = delK(key: key, dictionary: dictionary)
        } else if let language = language {
            dictionary = delL(lang: language, dictionary: dictionary)
        }
        
        output.output(word: "delete complete")
        encode.encoding(dictionary: dictionary)
    }
}
