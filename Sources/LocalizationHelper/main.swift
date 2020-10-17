import Foundation

var dictionary: [[String : [String:String] ] ] = []
var k: [String] = []
var v: [String] = []
var dictionaryKeys: [String] = []
var s: [String] = []


//var hello: [String : String] = [ "en" : "Hello", "ru" : "Привет", "pt" : "Hola"]
//v.append(contentsOf: hello.values)
//k.append(contentsOf: hello.keys)
//dictionary.append(["hello" : hello])
//dictionaryKeys.append(contentsOf: dictionary[0].keys)
//dictionaryValues.append(String(describing: dictionary[0]["hello"]))

func addWord(index: Int, dict: String, word: String, en: String, ru: String, pt: String) {
    let word: [String : String] = [ "en" : en, "ru" : ru, "pt" : pt]
    v.append(contentsOf: word.values)
    k.append(contentsOf: word.keys)
    dictionary.append([dict : word])
    dictionaryKeys.append(contentsOf: dictionary[index].keys)
}

addWord(index: 0, dict: "hello", word: "hello", en: "Hello", ru: "Привет", pt: "Hola")
addWord(index: 1, dict: "day", word: "day", en: "Day", ru: "День", pt: "Dia")
addWord(index: 2, dict: "terms", word: "terms", en: "Terms", ru: "Срок", pt: "Termos")


func printAllWords() {
    print("\(dictionaryKeys[0])\n\(k[0]) : \(v[0])\n\(k[1]) : \(v[1])\n\(k[2]) : \(v[2])")
    print("\(dictionaryKeys[1])\n\(k[3]) : \(v[3])\n\(k[4]) : \(v[4])\n\(k[5]) : \(v[5])")
    print("\(dictionaryKeys[2])\n\(k[6]) : \(v[6])\n\(k[7]) : \(v[7])\n\(k[8]) : \(v[8])")
}
func printK() {
    print("\(dictionaryKeys[0])\n\(k[0]) : \(v[0])\n\(k[1]) : \(v[1])\n\(k[2]) : \(v[2])")
}
printAllWords()

//перебор 
let countries = ["Iran", "Iraq", "Syria", "Lebanon", "Iran"]
let capitals = ["Tehran", "Bagdad", "Damascus", "Beirut", "Tehran"]
var seq = zip(k, v)
 
var dict = Dictionary(seq, uniquingKeysWith:{return $1})
 
for (key, value) in dict {
    print("\(key) - \(value)")
}









