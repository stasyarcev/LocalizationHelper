
import Foundation
import ArgumentParser

//json
let patch = "dictionary.json"
let decoder = JSONDecoder()
var dictionary: [String : [String:String]] = [:]

if let jsonDict = FileManager.default.contents(atPath: patch) {
    dictionary = (try? decoder.decode([String: [String: String]].self, from: jsonDict)) ?? [:]
} else {
    dictionary = [:]
}

//math
var math = false

//-l
func l(lang: String) {
    for (key, values) in dictionary {
        for (language, word) in values {
            if language == lang {
                math = true
                print("\(key): \(word)")
            }
        }
    }
    if math == false {
        print("Not found")
    }
}

//-k
func k(key: String) {
    for (word, values) in dictionary {
        if word.lowercased() == key.lowercased() {
            math = true
            print(key)
            for (langValue, wordValue) in values {
                print("\(langValue): \(wordValue)")
            }
        }
    }
    if math == false {
        print("Not found")
    }
}

// booth
func kl(key: String, lang: String) {
    for (keys, values) in dictionary {
        if keys == key {
            for (language, word) in values {
                if lang == language {
                    math = true
                    print(word)
                }
            }
        }
    }
    if math == false {
        print("Not found")
    }
}

func def() {
    for (word, trans) in dictionary {
        print(word)
        for (lang, val) in trans {
            print("\(lang): \(val)")
        }
    }
}

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

//Для поиска слов теперь использовать конструкцию с ключевым словом search. Работа с ключами остается прежней, они оба опциональные.
//> app search -k <key> -l <language>

struct Search: ParsableCommand {
    //
}

//Для обновления (добавления) используем ключевое слово update. Оба ключа обязательны.
//> app update <word> -k <key> -l <language>

struct Update: ParsableCommand {
    //
}

//Для удаления используем ключевое слово delete. Обязателен один из ключей, могут использоваться оба ключа.
//> app delete -k <key> -l <language>

struct Delete: ParsableCommand {
    //
}

Values.main()
