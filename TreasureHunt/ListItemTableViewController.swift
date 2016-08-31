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
    
    var knownBeacons: [CLBeacon] = [] {
        didSet {
            for clBeacon in knownBeacons {
                let b = Beacon(clBeacon: clBeacon)
                
                BeaconManager.sharedInstance.addBeacon(b, requiredIndex: reqIndex)
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
        
        cell.showItem(advaneture.items[indexPath.row])
        
        return cell
    }
}

