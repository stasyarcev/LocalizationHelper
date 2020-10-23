//
//  ArgumentParser.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 23.10.2020.
//

import ArgumentParser
import Foundation

class ArgumentParser: ArgumentParserProtocol {
    func parse() {
        guard  let rawArguments = try? ApplicationOptions.parse() else {
            print(ApplicationOptions.helpMessage())
            exit(withError: 0)
        }
        
        return Arguments(
            key: rawArguments.key,
            language: rawArguments.language
        )
    }
}

private struct ApplicationOptions: ParsableArguments {
    @Option(name: .shortAndLong, help: ArgumentHelp("Localization key", valueName: "key"))
    var key: String?
    
    @Option(name: .shortAndLong, help: ArgumentHelp("Localization language", valueName: "language"))
    var language: String?
}




