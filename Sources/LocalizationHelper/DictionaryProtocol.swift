//
//  DictionaryProtocol.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 07.11.2020.
//

protocol DictionaryProtocol {
    func jsonDecoding() -> ([String: [String: String]])
    func jsonEncoding(dictionary: [String: [String: String]])
}
