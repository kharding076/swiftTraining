//
//  ViewController.swift
//  Users Speed and Data
//
//  Created by Kyle Harding on 9/3/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var lblAlt: UILabel!
    @IBOutlet weak var lblLat: UILabel!
    @IBOutlet weak var lblLong: UILabel!
    @IBOutlet weak var lblCourse: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        let alt = userLocation.altitude
        let lat = userLocation.coordinate.latitude
        let long = userLocation.coordinate.longitude
        let course = userLocation.course
        let speed = userLocation.speed
        
        lblAlt.text = "Altitude: \(alt)"
        lblLat.text = "Latitude: \(lat)"
        lblLong.text = "Longitude: \(long)"
        lblCourse.text = "Course: \(course)"
        lblSpeed.text = "Speed: \(speed)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) -> Void in
            if error != nil {
                print(error)
            }else {
                let pm = placemarks as [CLPlacemark]?
                if pm?.count > 0{
                    pm.hel
                }
            }
        }
        
     

    }
}
