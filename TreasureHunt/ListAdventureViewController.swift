//
//  ListAdventureViewController.swift
//  TreasureHunt
//
//  Created by Hieu Nguyen on 21/08/16.
//  Copyright © 2016 iosdev. All rights reserved.
//

import UIKit

class ListAdventureViewController: UITableViewController {
    
    var listAdventure: [Adventure] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        NetworkService.sharedInstance.loadAdventures({ (adventures) in
            self.listAdventure = adventures
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let items = sender as? [Item], destVC = segue.destinationViewController as? ListItemTableViewController {
            destVC.items = items
        }
    }
}

//MARK: UITableViewDataSource, UITableViewDelegate
extension ListAdventureViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listAdventure.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("kListBeaconCell")! as UITableViewCell
        
        let adventure = listAdventure[indexPath.row]
        
        cell.detailTextLabel?.text = adventure.getName()
        cell.textLabel?.text = adventure.getDescription()
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let items = listAdventure[indexPath.row].items
        
        performSegueWithIdentifier("kShowListItemSegue", sender: items)
    }
}