//
//  UIColor+Extension.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int) {
        assert(r >= 0 && r <= 255, "Invalid red component")
        assert(g >= 0 && g <= 255, "Invalid green component")
        assert(b >= 0 && b <= 255, "Invalid blue component")
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(r:(netHex >> 16) & 0xff, g:(netHex >> 8) & 0xff, b:netHex & 0xff)
    }
    
    // Naviagtion
    static let colorNavigationBackground = UIColor(r: 6, g: 72, b: 72)
    static let colorNavigationBarTintColor = UIColor.white
    
    // Text colors
    static let colorTextError = UIColor(netHex: 0xdc0c0b)
    static let colorTextTitle = UIColor(netHex: 0x00151a)
    static let colorTextTopNavigation = UIColor(netHex: 0x00151A)
    
    // Table view bg
    static let tableViewBgColor = UIColor.white
    static let tableViewSeparatorColor = UIColor(r: 7, g: 71, b: 89)
}
