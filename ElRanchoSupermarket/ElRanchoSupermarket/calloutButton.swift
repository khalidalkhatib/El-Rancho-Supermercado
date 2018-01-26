//
//  calloutButton.swift
//  ElRanchoSupermarket
//
//  Created by Khalid Alkhatib on 6/24/16.
//  Copyright © 2016 Khalid Alkhatib. All rights reserved.
//

import UIKit
import MapKit

class calloutButton: MKPinAnnotationView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let btn = UIButton(type: .DetailDisclosure)
        rightCalloutAccessoryView = btn
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

////////////////

@IBAction func Direction(sender: AnyObject) {
    
    self.performSegueWithIdentifier("showDirections", sender: self)
}

override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "showDirections" {
        let vc = segue.destinationViewController
        
        if #available(iOS 8.0, *) {
            let controller = vc.popoverPresentationController
            
            if controller != nil{
                controller?.delegate = self
            }
            
        } else {
            // Fallback on earlier versions
        }
    }
}

@available(iOS 8.0, *)
func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
    return .None
}

//////////////////////

@IBAction func yo(sender: AnyObject) {
    let string: String = "http://maps.apple.com/maps?daddr=38.895111,-77.036667"
    UIApplication.sharedApplication().openURL(NSURL(string: string)!)
}

//////////////////


for coordinate in coordinates
{
    let coords = coordinate as! [Double]
    let latitude: Double   = coords[0]
    let longitude: Double  = coords[1]
    let locationCoordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    let point = RestaurantAnnotation(coordinate: locationCoordinates)
    point.title = names[currentRestaurantIndex]
    point.image = images[currentRestaurantIndex]
    self.mapView.addAnnotation(point)
}


///////////////////////


var i = 0
for coordinate in coordinates
{
    let coords = coordinate as! [Double]
    let latitude: Double   = coords[0]
    let longitude: Double  = coords[1]
    let locationCoordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    let point = RestaurantAnnotation(coordinate: locationCoordinates)
    point.title = names[i]
    point.image = images[i]
    i += 1
    self.mapView.addAnnotation(point)
}