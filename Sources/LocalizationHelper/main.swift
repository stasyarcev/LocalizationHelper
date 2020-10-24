
import Foundation

//json
let patch = "Dictionary.json"
let decoder = JSONDecoder()
var dictionary: [[String : [String:String]]] = [[:]]



//math
var math = false

//-l
func l(lang: String) {
    for i in 0 ..< dictionary.count {
        for (key, values) in dictionary[i] {
            for (language, word) in values {
                if language == lang {
                    math = true
                    print("\(key): \(word)")
                }
            }
        }
    }
    if math == false {
        print("Not found")
    }
}

//-k
func k(key: String) {
    for i in 0 ..< dictionary.count {
        for (word, values) in dictionary[i] {
            if word.lowercased() == key.lowercased() {
                math = true
                print(key)
                for (langValue, wordValue) in values {
                    print("\(langValue): \(wordValue)")
                }
            }
        }
    }
    if math == false {
        print("Not found")
    }
}

// booth
func kl(key: String, lang: String) {
    for i in 0 ..< dictionary.count {
        for (keys, values) in dictionary[i] {
            if keys == key {
                for (language, word) in values {
                    if lang == language {
                        math = true
                        print(word)
                    }
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

Values.main()
