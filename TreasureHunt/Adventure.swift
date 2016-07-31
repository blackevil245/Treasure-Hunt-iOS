//
//  Adventure.swift
//  TreasureHunt
//
//  Created by iosdev on 28.4.2016.
//  Copyright © 2016 iosdev. All rights reserved.
//

class Adventure {
    
    let id: String
    let name: String
    let description: String
    let items: [AnyObject]
    
    init(id: String, name: String, description: String, item: [Item]) {
        self.id = id
        self.name = name
        self.description = description
        self.items = item
    }
}