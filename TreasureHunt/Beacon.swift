//
//  Beacon.swift
//  TreasureHunt
//
//  Created by iosdev on 28.4.2016.
//  Copyright © 2016 iosdev. All rights reserved.
//

class Beacon {
    
    let uuid: String
    let major: Int
    let minor: Int

    init(uuid: String, major:Int , minor: Int) {
        
        self.uuid = uuid
        self.major = major
        self.minor = minor
    }
    
    func getUuid() -> String {
        return self.uuid
    }
    
    func getMajor() -> Int {
        return self.major
    }
    
    func getMinor() -> Int {
        return self.minor
    }
    
}