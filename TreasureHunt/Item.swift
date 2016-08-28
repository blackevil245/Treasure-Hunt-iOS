//
//  Beacon.swift
//  TreasureHunt
//
//  Created by iosdev on 28.4.2016.
//  Copyright © 2016 iosdev. All rights reserved.
//
import Foundation
import ObjectMapper

struct Item: Mappable {
    
    var id: String?
    var name: String?
    var description: String?
    var beaconIndex: Int?
    var requiredBeaconIndex: [Int]?
    
    var isChecked: Bool = false
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        beaconIndex <- map["beacon"]
        description <- map["description"]
        requiredBeaconIndex <- map["required"]
    }
}