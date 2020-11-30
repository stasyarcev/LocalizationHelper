//
//  SearchMock.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 28.11.2020.
//

@testable import LocalizationHelper

class SearchMock: SearchProtocol {
    
    var searchParameters: (String?, String?)!
    var searchResult: SearchResults <SearchSuccess, SearchError> = .success(.searchingSuccess)
    var searchCallsCount = 0
    func searching(key: String?, language: String?) -> SearchResults<SearchSuccess, SearchError> {
        searchCallsCount += 1
        searchParameters = (key, language)
        return searchResult
    }
    
}
