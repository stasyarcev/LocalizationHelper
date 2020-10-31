
import Foundation
import ArgumentParser

// MARK: - JSON

var math = false
let path = Bundle.main.path(forResource: "dictionary", ofType: "json") ?? "dict.json"
let decoder = JSONDecoder()
let encoder = JSONEncoder()
var dictionary: [String : [String:String]] = [:]

// MARK: - JSON decoding

if let jsonDict = FileManager.default.contents(atPath: path) {
    dictionary = (try? decoder.decode([String: [String: String]].self, from: jsonDict)) ?? [:]
} else {
    dictionary = [:]
}

// MARK: - JSON encoding

func jsonEncoding(dict: [String: [String: String]]) {
    
    encoder.outputFormatting = .prettyPrinted
    let json = (try? encoder.encode(dict))
    guard let path = Bundle.main.url(forResource: "dictionary", withExtension: "json") else {
        return
    }
    try? json?.write(to: path)
}

// MARK: - commands

// add
func add(key: String, word: String, lang: String) -> [String: [String: String]] {
    //[dog: [en: Dog]]
    var newWord: [String: String] = dictionary[word] ?? [:]
    newWord[lang] = key
    dictionary[word] = newWord
    return dictionary
}

//delete -l
func delL(lang: String) -> [String: [String: String]] {
    //print("Deleting -l ...")
    for (key, values) in dictionary {
        var values = values
        values[lang] = nil
        dictionary[key] = values
    }
    return dictionary
}

//delete -k
func delK(key: String) -> [String: [String: String]] {
    dictionary[key] = nil
    return dictionary
}

//delete -k -l
func delKL(key: String, lang: String) -> [String: [String: String]] {
    //print("Deleting -k -l ...")
    var values = dictionary[key] ?? [:]
    values[lang] = nil
    dictionary[key] = values
    return dictionary
}

// -l
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

// -k
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

// booth -k -l
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

// show entire dictionary
func def() {
    for (word, trans) in dictionary {
        print(word)
        for (lang, val) in trans {
            print("\(lang): \(val)")
        }
    }
}

// MARK: - Parsing arguments

struct Values: ParsableCommand {
    
    static let configuration = CommandConfiguration(abstract: " Dictionary of words and their translation", subcommands: [Search.self, Update.self, Delete.self])
    
}

extension Values {
    
    //Для поиска слов теперь использовать конструкцию с ключевым словом search. Работа с ключами остается прежней, они оба опциональные.
    //> app search -k <key> -l <language>
    
    struct Search: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "To search for words now use the construction with the search subcommand. Working with keys is the same, they are both optional.")
        
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
    
    //Для обновления (добавления) используем ключевое слово update. Оба ключа обязательны.
    //> app update <word> -k <key> -l <language>

    struct Update: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "To update (add) use the update keyword. Both keys are required.")
        
        @Argument(help: "Update(add) word")
        var word: String
        
        @Option(name: .shortAndLong, help: "-k - name of the key for storing (adding) words")
        var key: String
        @Option(name: .shortAndLong, help: "Enter the language in which this 'word' is written.")
        var language: String
        
        
        func run() {
            dictionary = add(key: key.capitalizingFirstLetter(), word: word, lang: language)
            jsonEncoding(dict: dictionary)
        }
    }

    //Для удаления используем ключевое слово delete. Обязателен один из ключей, могут использоваться оба ключа.
    //> app delete -k <key> -l <language>

    struct Delete: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "To delete, use the delete keyword. One of the keys is required, both keys can be used.")
        
        @Option(name: .shortAndLong, help: "Delete 'word' by key.")
        var key: String?
        @Option(name: .shortAndLong, help: "Remove the translation of a word from a dictionary.")
        var language: String?
        
        func run() throws {
            
            if key == nil && language == nil {
                print("You can delete these words: ")
                def()
            } else if let key = key, language == nil {
                jsonEncoding(dict: delK(key: key))
            } else if let language = language, key == nil {
                jsonEncoding(dict: delL(lang: language))
            } else if let key = key, let language = language {
                jsonEncoding(dict: delKL(key: key, lang: language))
            }
        }
    }
}

Values.main()

// MARK: - Extensions

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
