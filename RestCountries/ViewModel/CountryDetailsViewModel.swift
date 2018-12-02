//
//  CountryDetailsViewModel.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/2/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import UIKit

struct CountryDetailsViewModel {
    let name: String
    let nativeName: String
    let flag: UIImageView
    
    // Dependency Injection (DI)
    init(country: Country) {
        self.name = country.name
        
        self.nativeName = "(\(country.nativeName))"
        
        if country.flag.isEmpty  {
            self.flag = UIImageView.init()
        } else {
            self.flag = UIImageView.init()
        }
    }
}
