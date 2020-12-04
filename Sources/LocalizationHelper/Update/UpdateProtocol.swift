//
//  UpdateProtocol.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 08.11.2020.
//

import Foundation

protocol UpdateProtocol {
    func updating(word: String, key: String, language: String) -> UpdateResults <UpdateSuccess, UpdateError>
}

enum UpdateSuccess {
    case updatingSuccess
}

enum UpdateResults <success, failure> {
    case success(UpdateSuccess)
    case failure(UpdateError)
}
