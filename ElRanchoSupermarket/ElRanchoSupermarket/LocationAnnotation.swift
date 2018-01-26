//
//  RestaurantAnnotation.swift
//  ElRanchoSupermarket
//
//  Created by Khalid Alkhatib on 6/28/16.
//  Copyright © 2016 Khalid Alkhatib. All rights reserved.
//

import UIKit
import MapKit

class LocationAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var image: UIImage?
    var eta: String?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
