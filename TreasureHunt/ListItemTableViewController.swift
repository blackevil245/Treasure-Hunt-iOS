//
//  ListItemTableViewController.swift
//  TreasureHunt
//
//  Created by Hieu Nguyen on 28/08/16.
//  Copyright © 2016 iosdev. All rights reserved.
//

import UIKit
import CoreLocation

class ListItemTableViewController: UITableViewController {
    var reqIndex: [Int] = []
    
    let locationManager = CLLocationManager()
    
    var knownBeacons: [CLBeacon] = [] {
        didSet {
            for clBeacon in knownBeacons {
                let b = Beacon(clBeacon: clBeacon)
                
                if BeaconManager.sharedInstance.addBeacon(b, requiredIndex: reqIndex) {
                    tableView.reloadData()
                }
            }
        }
    }
    
    var advaneture: Adventure = Adventure(id: "NaN", name: "NaN", description: "NaN", items: []) {
        didSet {
            reqIndex = advaneture.items.first?.requiredBeaconIndex ?? []
            
            self.tableView.reloadData()
        }
    }
    
    var adventureId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let uuid = NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D") {
            let region = CLBeaconRegion(proximityUUID: uuid, major: 1, minor: 1, identifier: "dmtx")
            locationManager.delegate = self
            locationManager.startRangingBeaconsInRegion(region)
        }
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(goBack))
        swipeRightGesture.direction = .Right
        
        
        self.view.addGestureRecognizer(swipeRightGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    @objc func goBack(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension ListItemTableViewController {
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return advaneture.getItems().count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ItemTableViewCell.reuseIdentifier, forIndexPath: indexPath) as! ItemTableViewCell
        
        let item = advaneture.items[indexPath.row]
        
        cell.showItem(item)
        
        cell.backgroundColor = UIColor.whiteColor()
        
        for b in BeaconManager.sharedInstance.beacons {
            if let bIndex = b.index, iIndex = item.beaconIndex where bIndex == iIndex {
                cell.backgroundColor = UIColor.greenColor()
            }
        }
        
        return cell
    }
}

extension ListItemTableViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        print(beacons.description)
        self.knownBeacons = beacons.filter{ $0.proximity != CLProximity.Unknown }
    }
    
}