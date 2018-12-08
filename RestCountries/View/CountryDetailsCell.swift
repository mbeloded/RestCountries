//
//  CountryDetailsCell.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/2/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import UIKit

class CountryDetailsCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var value: UILabel!
    
    var countryDetailsViewModel: CountryDetailViewModel! {
        didSet {
            label?.text = countryDetailsViewModel.name
            value?.text = countryDetailsViewModel.value
        }
    }
    
}
