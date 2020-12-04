//
//  UpdateError.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 27.11.2020.
//

enum UpdateError {
    
    case notFound

    var errorDescription: String {
        switch self {
        case .notFound:
            return "UpdateError: Value not found in dictionary"
        }
    }
}
