//
//  ItemTableViewCell.swift
//  TreasureHunt
//
//  Created by Hieu Nguyen on 28/08/16.
//  Copyright © 2016 iosdev. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    static let reuseIdentifier: String = "kListItemCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var beaconInxLabel: UILabel!
    
    @IBOutlet weak var beaconReqInxLabel: UILabel!
    
    func showItem(item: Item) {
        
        nameLabel.text = "Name: \(item.name ?? "")"
        
        descriptionLabel.text = "Description: \(item.description ?? "")"
        
        beaconInxLabel.text = "Item index: \(item.beaconIndex ?? 0)"
        
        beaconReqInxLabel.text = "Item required: \(item.requiredBeaconIndex?.description ?? "")"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
