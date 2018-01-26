//
//  SecondViewController.swift
//  ElRanchoSupermarket
//
//  Created by Khalid Alkhatib on 4/5/16.
//  Copyright © 2016 Khalid Alkhatib. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController, MKMapViewDelegate {
    
    
    // Properties
    var names:[String]!
    var images:[UIImage]!
    var descriptions:[String]!
    var coordinates:[AnyObject]!
    var currentRestaurantIndex: Int = 0
    var locationManager: CLLocationManager! // A reference to the location manager
    
    
    @IBOutlet var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Some restaurants in London
        names = ["1540 South First, Garland", "2770 Valwood Pkwy, Farmers Branch", "4121 Gaston Ave., Dallas", "1515 S. Buckner Blvd, Dallas", "655 W. Illinois #900, Dallas", "14211 Coit Rd., Dallas", "10020 Marsh Lane, Dallas", "2550 Gus Thomasson Rd, Dallas", "8752 Research Blvd, Austin", "6800 Berkman Drive, Austin", "701 S.Stemmons Frwy, Lewisville", "4450 W. Jefferson Blvd., Cockrell Hill", "4812 South Freeway, Fort Worth", "1212 N. Beach St., Fort Worth", "1909 E. Park Row Dr., Arlington", "1315 East 8th St., Odessa"]
        
        // Restaurants' images to show in the pin callout
        images = [UIImage(named: "logo2.jpg")!, UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,UIImage(named: "logo2.jpg")!,]
        
        // Latitudes, Longitudes
        coordinates = [
            [32.898578, -96.629920],
            [32.937376, -96.886663],
            [32.795285, -96.777031],
            [32.738366, -96.684320],
            [32.721330, -96.835041],
            [32.942104, -96.771164],
            [32.881648, -96.854814],
            [32.833722, -96.672419],
            [30.364967, -97.719727],
            [30.320287, -97.690493],
            [33.037157, -97.004900],
            [32.735484, -96.892687],
            [32.676027, -97.321732],
            [32.780261, -97.289935],
            [32.722135, -97.078973],
            [31.859514, -102.356522]
        ]
        
        currentRestaurantIndex = 0 // Start with the first Restaurant in the array
        
        // Ask for user permission to access location infos
        locationManager = CLLocationManager()
        if #available(iOS 8.0, *) {
            locationManager.requestWhenInUseAuthorization()
        } else {
            // Fallback on earlier versions
        }
        // Show the user current location
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        var i = 0
        for coordinate in coordinates
        {
            let coords = coordinate as! [Double]
            let latitude: Double   = coords[0]
            let longitude: Double  = coords[1]
            let locationCoordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let point = LocationAnnotation(coordinate: locationCoordinates)
            point.title = names[i]
            point.image = images[i]
            i += 1
            self.mapView.addAnnotation(point)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: MKMapViewDelegate
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // If annotation is not of type RestaurantAnnotation (MKUserLocation types for instance), return nil
        if !(annotation is LocationAnnotation){
            return nil
        }
        
        var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
        
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            annotationView?.canShowCallout = true
        }else{
            annotationView?.annotation = annotation
        }
        
        let restaurantAnnotation = annotation as! LocationAnnotation
        if #available(iOS 9.0, *) {
            annotationView?.detailCalloutAccessoryView = UIImageView(image: restaurantAnnotation.image)
        } else {
            // Fallback on earlier versions
        }
        
        // Left Accessory
        let imagetwo = UIImage(named: "ads.png")
        let buttontwo = UIButton(type: .custom)
        buttontwo.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        buttontwo.setImage(imagetwo, for: UIControlState())
        annotationView?.leftCalloutAccessoryView = buttontwo
        
        
        // Right accessory view
        let image = UIImage(named: "car2.png")
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setImage(image, for: UIControlState())
        annotationView?.rightCalloutAccessoryView = button
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let placemark = MKPlacemark(coordinate: view.annotation!.coordinate, addressDictionary: nil)
        // The map item is the restaurant location
        let mapItem = MKMapItem(placemark: placemark)
        
        let launchOptions = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
        mapItem.openInMaps(launchOptions: launchOptions)
    }
    
}



