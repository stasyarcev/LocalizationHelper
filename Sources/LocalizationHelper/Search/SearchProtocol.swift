//
//  SearchProtocol.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 07.11.2020.
//

import Foundation

protocol SearchProtocol {
    func searching(key: String?, language: String?) -> SearchResults <SearchSuccess, SearchError>
}

enum SearchSuccess {
    case searchingSuccess
    
}

enum SearchResults <success, failure> {
    case success(SearchSuccess)
    case failure(SearchError)
}
