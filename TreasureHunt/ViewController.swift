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
        
        if let uuid = NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D") {
            let region = CLBeaconRegion(proximityUUID: uuid, major: 1, minor: 1, identifier: "dmtx")
            locationManager.delegate = self
            locationManager.startRangingBeaconsInRegion(region)
        }
        
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

extension ViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        print(beacons.description)
        print(region)
        self.knownBeacons = beacons.filter{$0.proximity != CLProximity.Unknown && $0.proximity.rawValue == 1}
    }
    
}