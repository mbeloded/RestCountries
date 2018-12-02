//
//  Language.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import Foundation

struct Language: Decodable {
    let iso639_1: String?
    let iso639_2: String
    let name: String
    let nativeName: String
}
