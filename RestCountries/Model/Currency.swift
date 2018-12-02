//
//  Currency.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import Foundation

struct Currency: Decodable {
    let code: String?
    let name: String?
    let symbol: String?
}
