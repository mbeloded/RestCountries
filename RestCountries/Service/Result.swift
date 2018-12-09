//
//  Result.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/9/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}
