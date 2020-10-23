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
    var key: String
    @Option(name: .shortAndLong, help: "Displays all words of a 'languge'.")
    var language: String
    
    func run() throws {
            
        if key.isEmpty == true && language.isEmpty == true {
           def()
        } else if key.isEmpty == false && language.isEmpty == true {
            k(key: key)
        } else if key.isEmpty == true && language.isEmpty == false {
            l(lang: language)
        } else if key.isEmpty == false && language.isEmpty == false {
            kl(key: key, lang: language)
        }
    }
}



