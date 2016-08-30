//
//  Beacon.swift
//  TreasureHunt
//
//  Created by iosdev on 28.4.2016.
//  Copyright © 2016 iosdev. All rights reserved.
//

import Foundation
import ObjectMapper
import CoreLocation

class Beacon: Mappable {
    var uuid: String?
    var major: Int?
    var minor: Int?
    var index: Int?
    
    required init?(_ map: Map) {
        
    }
    
    init(clBeacon: CLBeacon) {
        uuid = clBeacon.proximityUUID.UUIDString
        major = clBeacon.major.integerValue
        minor = clBeacon.minor.integerValue
    }
    
    func mapping(map: Map) {
        uuid <- map["uuid"]
        major <- map["major"]
        minor <- map["minor"]
        index <- map["index"]
    }
}

extension Beacon {
    func equal(beacon: Beacon) -> Bool {
        if self.uuid == beacon.uuid && self.major == beacon.major && self.minor == beacon.minor {
            return true
        }
        
        return false
    }
}