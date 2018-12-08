//
//  CountryViewModel.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import UIKit

struct CountryViewModel {
    
    let name: String
    let nativeName: String
    let population: String
    
    let flagImageUrl: String
    
    var details: [CountryDetailViewModel] = []
    
    // Dependency Injection (DI)
    init(country: Country) {
        self.name = country.name
        
        self.nativeName = "(\(country.nativeName))"
        
        self.population = "\(country.population)"
        
        self.flagImageUrl = "https://www.countryflags.io/" + country.alpha2Code + "/flat/64.png"//country.flag -- to avoid issues with loading/rendering SVG file
        
        self.details.append(CountryDetailViewModel.init(name: "flagUrl", value: self.flagImageUrl))
        self.details.append(CountryDetailViewModel.init(name: "capital", value: country.capital))
        self.details.append(CountryDetailViewModel.init(name: "region", value: country.region))
        self.details.append(CountryDetailViewModel.init(name: "subregion", value: country.subregion))
        self.details.append(CountryDetailViewModel.init(name: "latlng", value: "\(country.latlng.first ?? 0.0), \(country.latlng.last ?? 0.0)"))
        self.details.append(CountryDetailViewModel.init(name: "demonym", value: "\(country.area ?? 0)km²"))
        self.details.append(CountryDetailViewModel.init(name: "area", value: self.flagImageUrl))
        self.details.append(CountryDetailViewModel.init(name: "borders", value: country.borders.joined(separator: ", ")))
    
    }
    
}
