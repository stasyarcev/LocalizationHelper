import Foundation


dictionary.append(["hello" : hello])


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
        if dictionary[i].keys.contains(word) == true {
            for (lang, val) in dictionary[i].values.first! {
                if lang == lang {
                    math = true
                    print(val)
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

if CommandLine.arguments.count == 1 {
    def()
} else if CommandLine.arguments.count == 3 {
    if CommandLine.arguments[1] == "-k" && CommandLine.arguments.count == 3 {
        let word = CommandLine.arguments[2]
        k(word: word)
    } else if CommandLine.arguments[1] == "-l" {
        let word = CommandLine.arguments[2]
        l(word: word)
    }
} else if CommandLine.arguments.count == 5 {
    let word = CommandLine.arguments[2]
    let lang = CommandLine.arguments[4]
    kl(word: word, lang: lang)
}

