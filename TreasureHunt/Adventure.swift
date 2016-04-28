//
//  Adventure.swift
//  TreasureHunt
//
//  Created by iosdev on 28.4.2016.
//  Copyright © 2016 iosdev. All rights reserved.
//

class Adventure {
    let name: String
    let desc: String
    let item: [Item]
    
    init(name: String, desc: String, item: [Item]) {
        self.name = name
        self.desc = desc
        self.item = item
    }
}