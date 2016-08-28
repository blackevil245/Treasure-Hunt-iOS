//
//  DetailViewController.swift
//  TreasureHunt
//
//  Created by iosdev on 21/08/16.
//  Copyright © 2016 iosdev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var beaconID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        if let beaconID = beaconID {
            NetworkService.sharedInstance.loadAdventures(<#T##completionHandler: (adventures: [Adventure]) -> Void##(adventures: [Adventure]) -> Void#>)
        }
    }

}
