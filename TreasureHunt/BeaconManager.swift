//
//  BeaconManager.swift
//  TreasureHunt
//
//  Created by Hieu Nguyen on 30/08/16.
//  Copyright © 2016 iosdev. All rights reserved.
//

import Foundation

class BeaconManager {
    static let sharedInstance = BeaconManager()
    
    var beacons: [Beacon] = []
    var sourceBeacon: [Beacon] = []
    
    func refreshList() {
        beacons = []
    }
    
    func removeBeacon(beacon: Beacon) {
        for (i, b) in beacons.enumerate() {
            if b.equal(beacon) {
                beacons.removeAtIndex(i)
            }
        }
    }
    
    func addBeacon(beacon: Beacon, requiredIndex: [Int]) -> Bool {
        //Prevent duplicate beacon
        for b in beacons {
            if b.equal(beacon) {
                return false
            }
        }
        
        //fetching beacon from source, with index filter
        for b in sourceBeacon {
            if b.equal(beacon) && availableIndex(requiredIndex) {
                beacons.append(b)
                
                return true
            }
        }
        
        return false
    }
    
    private func availableIndex(reqIndex: [Int]) -> Bool {
        if reqIndex.count == 0 {
            return true
        }
        
        if reqIndex.count != beacons.count {
            return false
        }
        
        var count: Int = 0
        
        for b in beacons {
            for i in reqIndex {
                if b.index == i {
                    count += 1
                }
            }
        }
        
        return count == reqIndex.count
    }
}