
import Foundation
import ArgumentParser

// MARK: - JSON
var math = false
let path = Bundle.main.path(forResource: "dictionary", ofType: "json") ?? "dictionary.json"
let decoder = JSONDecoder()
let encoder = JSONEncoder()
var dictionary: [String : [String:String]] = [:]

// MARK: - JSON decoding

if let jsonDictionary = FileManager.default.contents(atPath: path) {
    dictionary = (try? decoder.decode([String: [String: String]].self, from: jsonDictionary)) ?? [:]
} else {
    dictionary = [:]
}

// MARK: - JSON encoding

func jsonEncoding(dictionary: [String: [String: String]]) {
    
    encoder.outputFormatting = .prettyPrinted
    let json = (try? encoder.encode(dictionary))
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
    for (keyDictionary, valuesDictionary) in dictionary {
        var values = valuesDictionary
        values[lang] = nil
        dictionary[keyDictionary] = values
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
    for (keyDictionary, valuesDictionary) in dictionary {
        for (language, word) in valuesDictionary {
            if language == lang {
                math.toggle()
                print("\(keyDictionary): \(word)")
            }
        }
    }
    if math == false {
        print("Not found")
    }
}

// -k
func k(key: String) {
    for (keyDictionary, valuesDictionary) in dictionary {
        if keyDictionary.lowercased() == key.lowercased() {
            math.toggle()
            print(key)
            for (language, word) in valuesDictionary {
                print("\(language): \(word)")
            }
        }
    }
    if math == false {
        print("Not found")
    }
}

// booth -k -l
func kl(key: String, lang: String) {
    for (keyDictionary, valuesDictionary) in dictionary {
        if keyDictionary == key {
            for (language, word) in valuesDictionary {
                if language == lang {
                    math.toggle()
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
    for (keyDictionary, valuesDictionary) in dictionary {
        print(keyDictionary)
        for (language, word) in valuesDictionary {
            print("\(language): \(word)")
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
            jsonEncoding(dictionary: dictionary)
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
                jsonEncoding(dictionary: delK(key: key))
            } else if let language = language, key == nil {
                jsonEncoding(dictionary: delL(lang: language))
            } else if let key = key, let language = language {
                jsonEncoding(dictionary: delKL(key: key, lang: language))
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
