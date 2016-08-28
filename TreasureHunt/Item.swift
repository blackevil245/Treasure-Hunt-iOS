//
//  Beacon.swift
//  TreasureHunt
//
//  Created by iosdev on 28.4.2016.
//  Copyright © 2016 iosdev. All rights reserved.
//

class Item {
    
    let id: String?
    let name: String?
    let description: String?
    let beaconIndex: Int?
    let requiredBeaconIndex: [Int]?
    
    var isChecked: Bool = false
    
    init(id: String, name: String, description:String , beaconIndex: Int, requiredBeaconIndex: [Int]) {
        self.id = id
        self.name = name
        self.description = description
        self.beaconIndex = beaconIndex
        self.requiredBeaconIndex = requiredBeaconIndex
    }        
    
    func getName() -> String {
        return self.name ?? "Name not availabel"
    }
    
    func getDescription() -> String {
        return self.description ?? "Description not availabel"
    }
    
    func getBeaconIndex() -> Int {
        return self.beaconIndex ?? 0
    }
    
    func getRequiredBeaconIndex() -> [Int] {
        return self.requiredBeaconIndex ?? []
    }
}