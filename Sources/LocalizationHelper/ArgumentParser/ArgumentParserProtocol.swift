//
//  ArgumentParserProtocol.swift
//  LocalizationHelper
//
//  Created by Стас Ярцев on 23.10.2020.
//

import Foundation
import ArgumentParser

public protocol ArgumentParserProtocol: ParsableArguments {
  func parse() throws
    var Arguments: String { get }
}
