//
//  DeleteError.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 27.11.2020.
//

enum DeleteError {
    
    case notFound

    var errorDescription: String {
        switch self {
        case .notFound:
            return "DeleteError: Value not found in dictionary"
        }
    }
    
}
