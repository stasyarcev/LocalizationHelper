//
//  ArgumentsParserError.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 27.11.2020.
//

public enum ArgumentsParserError {
    case commandNotFound(text: String)
    case parseError(text: String)

    var errorDescription: String {
        switch self {
        case .commandNotFound:
            return "Сommand not found"
        case .parseError:
            return "Parsing error"
        }
    }
}
