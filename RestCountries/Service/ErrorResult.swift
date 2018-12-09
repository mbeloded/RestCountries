//
//  ErrorResult.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/9/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
