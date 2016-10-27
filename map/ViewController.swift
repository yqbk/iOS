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
    }
    @IBAction func onStop(sender: AnyObject) {
    }
    @IBAction func onClear(sender: AnyObject) {
    }
    
    var myLocationManager: CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (CLLocationManager.locationServicesEnabled())
        {
            myLocationManager = CLLocationManager()
            myLocationManager.delegate = self
            myLocationManager.requestWhenInUseAuthorization()
            myLocationManager.startUpdatingLocation()
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // do ustawienia
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentPosition = locations.last?.coordinate
        
        print(currentPosition)
    }


}

