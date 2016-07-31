//
//  Beacon.swift
//  TreasureHunt
//
//  Created by iosdev on 28.4.2016.
//  Copyright © 2016 iosdev. All rights reserved.
//

class Beacon {
    
    let uuid: String
    let major: String
    let minor: String

    init(uuid: String, major:String , minor: String) {
        
        self.uuid = uuid
        self.major = major
        self.minor = minor
    }
    
}