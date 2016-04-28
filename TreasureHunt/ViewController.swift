//
//  ViewController.swift
//  TreasureHunt
//
//  Created by iosdev on 28.4.2016.
//  Copyright © 2016 iosdev. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: Outlet
    @IBOutlet weak var adventureName: UILabel!
    @IBOutlet weak var adventureDesc: UITextView!
    @IBOutlet weak var requiredItems: UITextView!
    @IBOutlet weak var nextCheckpoint: UILabel!
    @IBOutlet weak var checkpointHint: UITextView!
    
    // MARK: Props
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "Estimotes")
    var knownBeacons: [CLBeacon] = []
    var adventure: Adventure?
    var acquiredItems: [Item] = []
    
    var currentItem: Item?
    var currentItemIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load adventure
        adventure = loadAdventure()
        currentItem = adventure!.item[currentItemIndex]
        loadData()
        
        // Ranging beacon
        locationManager.delegate = self
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeaconsInRegion(region)
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        self.knownBeacons = beacons.filter{$0.proximity != CLProximity.Unknown && $0.proximity.rawValue == 1}
        if (self.knownBeacons[0].major == currentItem!.major && self.knownBeacons[0].minor == currentItem!.minor ) {
            acquireItem(currentItem!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        // Set init text on screen
        adventureName.text = adventure!.name
        adventureDesc.text = adventure!.desc
        
        var itemText = ""
        for item in adventure!.item {
            itemText = itemText + item.name + "\n"
        }
        
        requiredItems.text = itemText
        nextCheckpoint.text = "Next Checkpoint: " + (currentItem?.name)!
        checkpointHint.text = currentItem?.desc
    }
    
    func acquireItem(item: Item) {
        acquiredItems.append(item)
        currentItemIndex += 1
        currentItem = adventure?.item[currentItemIndex]
        loadData()
    }
    
    // MARK: Loading
    func loadItems() -> [Item] {
        var items: [Item] = []
        let item0 = Item(name: "Map piece no.1", desc: "By the door next to the cafeteria", major: 46880, minor: 36104)
        let item1 = Item(name: "Map piece no.2", desc: "In front of room B204", major: 57832, minor: 7199)
        let item2 = Item(name: "Map piece no.3", desc: "Second floor Bathroom", major: 911, minor: 912)
        
        items.append(item0)
        items.append(item1)
        items.append(item2)
        
        return items
    }
    
    func loadAdventure() -> Adventure {
        let adventureItems: [Item] = loadItems()
        let adventure =  Adventure(name: "Path of the Prophet", desc: "You are a PROPHET, go do some stuff searching, missions moving, people helping thing that you always do", item: adventureItems)
        
        return adventure
    }
}

