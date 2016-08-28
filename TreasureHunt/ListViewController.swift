//
//  ListViewController.swift
//  TreasureHunt
//
//  Created by Hieu Nguyen on 21/08/16.
//  Copyright © 2016 iosdev. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var listBeacon: [Beacon] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        NetworkService.sharedInstance.getBeaconsList { (beacons) in
            self.listBeacon = beacons                        
        }
    }
    
}

//MARK: UITableViewDataSource, UITableViewDelegate
extension ListViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBeacon.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("kListBeaconCell")! as UITableViewCell
        
        let beacon = listBeacon[indexPath.row] as Beacon
        
        cell.detailTextLabel?.text = beacon.getUuid()
        cell.textLabel?.text = "\(beacon.getMajor())- \(beacon.getMinor())"
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}