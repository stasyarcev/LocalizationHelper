
import Foundation

//math
var math = false

//-l
func l(lang: String) {
    for i in 0 ..< dictionary.count {
        if dictionary[i].values.first?.keys.contains(lang) == true {
            math = true
            for (l, v) in dictionary[i].values.first! {
                if l == lang {
                    print("\(dictionary[i].keys.first!) : \(v)")
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
        if dictionary[i].keys.contains(key) == true {
            math = true
            print(key)
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
func kl(key: String, lang: String) {
    for i in 0 ..< dictionary.count {
        if dictionary[i].keys.first!.contains(key) {
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

Values.main()
