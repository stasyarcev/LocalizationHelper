//
//  Utils.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 06.11.2020.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

var wordInDictionary = false

func notFound(it wordInDictionary: Bool) {
    guard wordInDictionary == true else {
        return print("Not found")
    }
}
