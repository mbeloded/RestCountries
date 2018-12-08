//
//  CountryCell.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftSVG

class CountryCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    var countryViewModel: CountryViewModel! {
        didSet {
            titleLabel?.text = countryViewModel.name + " \(countryViewModel.nativeName)"
            subtitleLabel?.text = "population.label".localized + " " + countryViewModel.population
            
//            loadSVGFlag() //we can use it but it's not working stable, app can crash if image URL is empty or wrong for ex.
            
            flagImageView.kf.setImage(with: URL(string: countryViewModel.flagImageUrl))
            
        }
    }
    
    func loadSVGFlag() {
        let svgURL = URL(string: countryViewModel.flagImageUrl)!
        
        let hammock = UIView(SVGURL: svgURL) { (svgLayer) in
            svgLayer.resizeToFit(self.flagImageView.bounds)
        }
        
        flagImageView.layer.addSublayer(hammock.layer)
    }
    
}
