//
//  Country.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import Foundation

struct Country: Decodable {
    
    let name: String
    let alpha2Code: String
    let alpha3Code: String
    let capital: String
    let region: String
    let subregion: String
    let population: Int32
    let latlng: [Double]
    let demonym: String
    let area: Float?
    let borders: [String]
    let nativeName: String
    let currencies: [Currency]
    let languages: [Language]
    let flag: String
    
    /*
     "name": "Colombia",
     "topLevelDomain": [".co"],
     "alpha2Code": "CO",
     "alpha3Code": "COL",
     "callingCodes": ["57"],
     "capital": "Bogotá",
     "altSpellings": ["CO", "Republic of Colombia", "República de Colombia"],
     "region": "Americas",
     "subregion": "South America",
     "population": 48759958,
     "latlng": [4.0, -72.0],
     "demonym": "Colombian",
     "area": 1141748.0,
     "gini": 55.9,
     "timezones": ["UTC-05:00"],
     "borders": ["BRA", "ECU", "PAN", "PER", "VEN"],
     "nativeName": "Colombia",
     "numericCode": "170",
     "currencies": [{
     "code": "COP",
     "name": "Colombian peso",
     "symbol": "$"
     }],
     "languages": [{
     "iso639_1": "es",
     "iso639_2": "spa",
     "name": "Spanish",
     "nativeName": "Español"
     }],
     "translations": {
     "de": "Kolumbien",
     "es": "Colombia",
     "fr": "Colombie",
     "ja": "コロンビア",
     "it": "Colombia",
     "br": "Colômbia",
     "pt": "Colômbia"
     },
     "flag": "https://restcountries.eu/data/col.svg",
     "regionalBlocs": [{
     "acronym": "PA",
     "name": "Pacific Alliance",
     "otherAcronyms": [],
     "otherNames": ["Alianza del Pacífico"]
     }, {
     "acronym": "USAN",
     "name": "Union of South American Nations",
     "otherAcronyms": ["UNASUR", "UNASUL", "UZAN"],
     "otherNames": ["Unión de Naciones Suramericanas", "União de Nações Sul-Americanas", "Unie van Zuid-Amerikaanse Naties", "South American Union"]
     }],
     "cioc": "COL"
     */
}
