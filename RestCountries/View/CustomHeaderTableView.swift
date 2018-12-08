//
//  CustomHeaderTableView.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import UIKit

class CustomHeaderTableView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    private var header: UIImageView!
    
    public func setHeader(imageView: UIImageView) {
        header = imageView
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        headerImageView.image = header.image
        
    }

}
