//
//  ListItemTableViewController.swift
//  TreasureHunt
//
//  Created by Hieu Nguyen on 28/08/16.
//  Copyright © 2016 iosdev. All rights reserved.
//

import UIKit

class ListItemTableViewController: UITableViewController {
    var items: [Item] = [] {
        didSet {
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
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ItemTableViewCell.reuseIdentifier, forIndexPath: indexPath) as! ItemTableViewCell
        
        cell.showItem(items[indexPath.row])
        
        return cell
    }
}
