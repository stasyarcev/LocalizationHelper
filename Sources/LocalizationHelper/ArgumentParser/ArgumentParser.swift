//
//  ArgumentParser.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 23.10.2020.
//

import ArgumentParser
import Foundation

struct Values: ParsableCommand {

    @Option(name: .shortAndLong, help: "Displays all translations of a 'word'.")
    var key: String?
    @Option(name: .shortAndLong, help: "Displays all words of a 'language'.")
    var language: String?
    
    func run() throws {
            
        if key == nil && language == nil {
            def()
        } else if let key = key, language == nil {
            k(key: key)
        } else if let language = language, key == nil {
            l(lang: language)
        } else if let key = key, let language = language {
            kl(key: key, lang: language)
        }
    }
}
