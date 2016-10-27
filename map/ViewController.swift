//
//  ViewController.swift
//  map
//
//  Created by Użytkownik Gość on 27.10.2016.
//  Copyright © 2016 Użytkownik Gość. All rights reserved.
//

import UIKit

// oddac te 2 importy
import MapKit
import CoreLocation

//dziedziczyc po klasie cll location manager
class ViewController: UIViewController, CLLocationManagerDelegate {


    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var clear: UIButton!
    
    @IBAction func onStart(sender: AnyObject) {
        
        myLocationManager.startUpdatingLocation()
        start.enabled = false
        stop.enabled = true
        map.showsUserLocation = true
    
    }
    
    @IBAction func onStop(sender: AnyObject) {
        stop.enabled = false
        start.enabled = true
        myLocationManager.stopUpdatingLocation()
        map.showsUserLocation = false
    }
    
    @IBAction func onClear(sender: AnyObject) {
    }
    
    var myLocationManager: CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stop.enabled = false;

        if (CLLocationManager.locationServicesEnabled())
        {
            myLocationManager = CLLocationManager()
            myLocationManager.delegate = self
            myLocationManager.requestWhenInUseAuthorization()
            myLocationManager.startUpdatingLocation()
        }
    
    }

    // do ustawienia
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentPosition = locations.last?.coordinate
                
        var spanDelta = 0.0
                
        // Pierwszy warunek - sprawdz czy zmienna istnieje. potem - sprawdzamy czy wieksze od zera zeby dzielic
        if let speed = locations.last?.speed where speed > 0
        {
            spanDelta = speed / 5000
        }
        
        let locationArea = MKCoordinateRegion(center: currentPosition!, span: MKCoordinateSpan(latitudeDelta: spanDelta, longitudeDelta: spanDelta))
                
        map.setRegion(locationArea, animated: true)
                
        let pin = MKPointAnnotation()
        pin.coordinate = currentPosition!
        
        map.addAnnotation(pin)
            
//        print(currentPosition)
    }


}

