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
    let items: [Item]
    
    init(id: String, name: String, description: String, items: [Item]) {
        self.id = id
        self.name = name
        self.description = description
        self.items = items
    }
    
    func getId() -> String {
        return self.id
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getDescription() -> String {
        return self.description
    }
    
    func getItems() -> [Item] {
        return self.items
    }
}