//
//  Dictionary.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 22.10.2020.
//

import Foundation

var dictionary: [[String : [String:String]]] = [
    ["hello": ["en": "Hello",
               "ru": "Привет",
               "pt": "Hola"]
    ],
    ["sun":   ["en": "Sun",
               "ru": "Солнце",
               "pt": "Sol"]
    ],
    ["cat":   ["en": "Cat",
               "ru": "Кошка",
               "pt": "Gate"]
    ]
]

//-l
func l(word: String) {
    var math = false
    for i in 0 ..< dictionary.count {
        if dictionary[i].values.first?.keys.contains(word) == true {
            math = true
            for lang in dictionary[i].keys {
                print("\(lang): \(dictionary[i].values.first![word]!)")
            }
        }
    }
    if math == false {
        print("Not found")
    }
}

//-k
func k(word: String) {
    var math = false
    for i in 0 ..< dictionary.count {
        if dictionary[i].keys.contains(word) == true {
            math = true
            print(word)
            for (lang, val) in dictionary[i].values.first! {
                print("\(lang): \(val)")
            }
        }
    }
    if math == false {
        print("Not found")
    }
}

// booth
func kl(word: String, lang: String) {
    var math = false
    for i in 0 ..< dictionary.count {
        if dictionary[i].keys.first!.contains(word) {
            for (language, value) in dictionary[i].values.first! {
                if language == lang {
                    math = true
                    print(value)
                }
            }
        }
    }
    if math == false {
        print("Not found")
    }
}

func def() {
    for i in 0 ..< dictionary.count {
        for (word, trans) in dictionary[i] {
            print(word)
            for (lang, val) in trans {
                print("\(lang): \(val)")
            }
        }
    }
}
