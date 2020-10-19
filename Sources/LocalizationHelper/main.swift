import Foundation

var dictionary: [[String : [String:String] ] ] = []


var hello: [String : String] = [ "en" : "Hello", "ru" : "Привет", "pt" : "Hola"]
dictionary.append(["hello" : hello])
var day: [String : String] = [ "en" : "Day", "ru" : "День", "pt" : "Dia"]
dictionary.append(["day" : day])
var sun: [String : String] = [ "en" : "Sun", "ru" : "Солнце", "pt" : "Suno"]
dictionary.append(["sun" : sun])


//если первый ключ у тебя сам ключ слова (например «hello» для слова «привет»), а второй – язык, то для распечатки с ключом -l можно пройти по всем элементам «внешнего» словаря, для каждого из них проверить, есть ли внутри словарь с ключем, соответствующим нужному языку (если есть, то берем это слово и выводим пару ключ=значение)

//print("\(dictionary[1])")
//print("\(hello.keys.contains("en"))")
//print(dictionary[i].values.first?.keys.contains("en"))
//print("\(dictionary[i].keys) = ")

//-l
func l(lang: String) {
    for i in 0 ..< dictionary.count {
        if dictionary[i].values.first?.keys.contains(lang) == true {
            print("\(dictionary[i].keys) = \(dictionary[i].values.first![lang]!)")
        }
    }
}
//l(lang: "ru")

//k
func k(word: String) {
    for i in 0 ..< dictionary.count {
        if dictionary[i].keys.contains(word) == true {
            print(dictionary[i].keys)
            print(dictionary[i].values)
        }
    }
}
//k(word: "sun")

func def() {
    for i in 0 ..< dictionary.count {
        print(dictionary[i])
    }
}

if CommandLine.arguments.count == 1 {
    guard let name = readLine(strippingNewline: true) else {
        exit(0)
    }
    values(key: name)
} else {
    let name = CommandLine.arguments[1]
    values(key: name)
}

func values(key: String) {
    if key == "-k" {
        k(word: "sun")
    } else if key == "-l" {
        l(lang: "en")
    }
    else {
        def()
    }
}
