//
//  ViewController.swift
//  TreasureHunt
//
//  Created by iosdev on 28.4.2016.
//  Copyright © 2016 iosdev. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    let locationManager = CLLocationManager()
    
    var knownBeacons: [CLBeacon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NetworkService.sharedInstance.getBeaconsList({ (beacons) in
            BeaconManager.sharedInstance.sourceBeacon = beacons
        }) { (error) in
            print("Error \(error.localizedDescription)")
        }
        
        // Ranging beacon
        
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }

    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

