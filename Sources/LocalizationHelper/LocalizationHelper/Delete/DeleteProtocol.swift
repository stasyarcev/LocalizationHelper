//
//  DeleteProtocol.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 07.11.2020.
//

import Foundation

protocol DeleteProtocol {
    func deleting(key: String?, language: String?) -> DeleteResults <DeleteSuccess, DeleteError>
}

enum DeleteSuccess {
    case deletingSuccess
}

enum DeleteResults <success, failure> {
    case success(DeleteSuccess)
    case failure(DeleteError)
}
