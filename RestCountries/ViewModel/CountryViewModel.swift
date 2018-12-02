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
    let accessoryType: UITableViewCell.AccessoryType
    
    // Dependency Injection (DI)
    init(country: Country) {
        self.name = country.name
        
        self.nativeName = "(\(country.nativeName))"
        
        if country.flag.isEmpty  {
            self.accessoryType = .disclosureIndicator
        } else {
            self.accessoryType = .none
        }
    }
    
}
