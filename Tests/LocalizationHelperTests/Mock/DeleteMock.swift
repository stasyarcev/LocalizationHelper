//
//  DeleteMock.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 28.11.2020.
//

@testable import LocalizationHelper

class DeleteMock: DeleteProtocol {
    
    var deleteParameters: (String?, String?)!
    var deleteResult: DeleteResults<DeleteSuccess, DeleteError> = .success(.deletingSuccess)
    var deleteCallsCount = 0
    
    func deleting(key: String?, language: String?) -> DeleteResults<DeleteSuccess, DeleteError> {
        deleteCallsCount += 1
        deleteParameters = (key, language)
        return deleteResult
    }
}

