
import Foundation


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
