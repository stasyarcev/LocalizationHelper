//
//  SearchResult.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 27.11.2020.
//

enum SearchError {
    
    case notFound

    var errorDescription: String {
        switch self {
        case .notFound:
            return "SearchError: Value not found in dictionary"
        }
    }
}
