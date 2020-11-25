//
//  ArgumentsParserProtocol.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 05.11.2020.
//

import Foundation

protocol ArgumentsParserProtocol {
    func parsing(_ arguments: [String]?) -> Arguments?
}

enum Arguments {
    case search(key: String?, language: String?)
    case update(word: String, key: String, language: String)
    case delete(key: String?, language: String?)
    case help(message: String)
}

