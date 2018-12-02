//
//  Common.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import Foundation

public class Common : NSObject
{
    struct Global{
        static let API_URL = "https://restcountries.eu/rest/v2"
        static let API_ALL = "/all"
        static let API_SEARCH_BY_NAME = "/name/%@"
    }
    
    static var getAll: String {
        return Common.Global.API_URL + Common.Global.API_ALL
    }
    
    static var searchCountryByName: String {
        return Common.Global.API_URL + Common.Global.API_SEARCH_BY_NAME
    }
}
