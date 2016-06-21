//
//  ViewController.swift
//  Memorable Places
//
//  Created by Kyle Harding on 9/9/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var manager: CLLocationManager!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 2.0
        mapView.addGestureRecognizer(uilpgr)
    }
    
    func action(gestureRecognizer: UIGestureRecognizer){
        if gestureRecognizer.state == UIGestureRecognizerState.Began{
            let touchPoint = gestureRecognizer.locationInView(self.mapView)
            let newCoordinate = self.mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
            let annotation = MKPointAnnotation()
            annotation.coordinate = newCoordinate
            annotation.title = "New Annotation"
            self.mapView.addAnnotation(annotation)
            let touchCoordinate = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
            
            let geoCoder = CLGeocoder()
            let location = CLLocation(latitude: touchCoordinate.latitude, longitude: touchCoordinate.longitude)

            
                CLGeocoder().reverseGeocodeLocation(location, completionHandler:
                    {(placemarks, error)  -> Void in
                        
                        if (error != nil) {
                            
                            print(error)
                            
                        } else {
                            
                            if let p = placemarks?[0] {
                                
                                var subThoroughfare:String = ""
                                
                                if (p.subThoroughfare != nil) {
                                    
                                    subThoroughfare = p.subThoroughfare!
                                    
                                }
                                
                                self.addressLabel.text = "\(subThoroughfare) \(p.thoroughfare) \n \(p.subLocality) \n \(p.subAdministrativeArea) \n \(p.postalCode) \n \(p.country)"
                                
                            }

                        var addressDictionary:Dictionary = p.addressDictionary!
                        
                        let addressLines = addressDictionary["FormattedAddressLines"]
                        
                        for (var i = 0; i < addressLines!.count ; i++){
                            
                            if let labelText = addressLines?[i]{
                                
                                address += labelText as! String
                                
                                address += "\n"
                            }
                        }
                                
                })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        let latDelta: CLLocationDegrees = 0.01
        let lonDelta: CLLocationDegrees = 0.01
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        self.mapView.setRegion(region, animated: true)
        
    }

}

