//
//  Beacon.swift
//  TreasureHunt
//
//  Created by iosdev on 28.4.2016.
//  Copyright © 2016 iosdev. All rights reserved.
//

class Item {
    
    let name: String
    let desc: String
    let major: Int
    let minor: Int

    init(name:String, desc:String, major:Int , minor: Int) {
        self.name = name
        self.desc = desc
        self.major = major
        self.minor = minor
    }
}