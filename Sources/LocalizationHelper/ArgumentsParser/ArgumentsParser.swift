//
//  ArgumentsParser.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 05.11.2020.
//

import ArgumentParser

class ArgumentParser: ArgumentsParserProtocol {
    
    func parsing(_ arguments: [String]?) -> Arguments? {
        do {
            let command = try Commands.parseAsRoot(arguments)
            
            switch command {
            case let command as Commands.Search:
                return .search(key: command.key, language: command.language)
            case let command as Commands.Delete:
                return .delete(key: command.key, language: command.language)
            case let command as Commands.Update:
                return .update(word: command.word, key: command.key, language: command.language)
            default:
                return .help(message: Commands.helpMessage())
            }
        }
        catch {
            return .help(message: Commands.helpMessage())
        }
    }
}

private struct Commands: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: " Dictionary of words and their translation",
        subcommands: [Search.self, Update.self, Delete.self]
    )
}

extension Commands {
    
    struct Search: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "To search for words now use the construction with the search subcommand. Working with keys is the same, they are both optional.")
        
        @Option(name: .shortAndLong, help: "Displays all translations of a 'word'.")
        var key: String?
        @Option(name: .shortAndLong, help: "Displays all words of a 'language'.")
        var language: String?
    }
    
    struct Update: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "To update (add) use the update keyword. Both keys are required.")
        
        @Argument(help: "Update(add) word")
        var word: String
        @Option(name: .shortAndLong, help: "-k - name of the key for storing (adding) words")
        var key: String
        @Option(name: .shortAndLong, help: "Enter the language in which this 'word' is written.")
        var language: String
    }
    
    struct Delete: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "To delete, use the delete keyword. One of the keys is required, both keys can be used.")
        
        @Option(name: .shortAndLong, help: "Delete 'word' by key.")
        var key: String?
        @Option(name: .shortAndLong, help: "Remove the translation of a word from a dictionary.")
        var language: String?
    }
}
