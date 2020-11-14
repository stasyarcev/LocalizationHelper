//
//  OutputProtocol.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 13.11.2020.
//

import Foundation

protocol OutputProtocol {
    func output(word: String)
    func outputKeyValue(key: String, value: String)
    func successFound(word inDictionary: Bool)
}
