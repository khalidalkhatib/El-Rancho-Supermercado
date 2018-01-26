//
//  CAGradientLayer+Convience.swift
//  ElRanchoSupermarket
//
//  Created by Khalid Alkhatib on 4/5/16.
//  Copyright © 2016 Khalid Alkhatib. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func orangeFade() -> CAGradientLayer {
        
        let topColor = UIColor(red: (207/255.0), green: (83/255.0), blue: (0/255.0), alpha: 1)
        let bottomColor = UIColor(red: (245/255.0), green: (241/255.0), blue: (222/255.0), alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]
        
        return gradientLayer 
    }
    
}


