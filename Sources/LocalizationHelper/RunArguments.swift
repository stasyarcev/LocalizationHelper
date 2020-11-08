//
//  RunArguments.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 06.11.2020.
//
import ArgumentParser

class RunArguments: RunArgumentsProtocol {

    func run(_ arguments: Arguments) {
        switch arguments {
        case .search(let key, let language):
            search(key, language)
        case .delete(let key, let language):
            delete(key, language)
        case .update(let word, let key, let language):
            update(word, key, language)
        default:
            return 
        }
    }
}
extension RunArguments {
    
    fileprivate func search(_ key: String?, _ language: String?) {
        Search().searching(key: key, language: language)
    }
    
    fileprivate func delete(_ key: String?, _ language: String?) {
        Delete().deleting(key: key, language: language)
    }
    
    fileprivate func update(_ word: String, _ key: String, _ language: String) {
        Update().updating(word: word, key: key, language: language)
    }
}


