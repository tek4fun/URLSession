//
//  Location.swift
//  Session
//
//  Created by techmaster on 4/4/17.
//  Copyright © 2017 Vinh The. All rights reserved.
//

import UIKit

class Location {
    var id : Int!
    var name : String!
    var address: String!
    var octime: String!
    var rate: Int!
    var lat: Int!
    var long: Int!
    var type: String!
    var district: String!
    
    init(info: JSONDictionary) {
        self.id = info["id"] as! Int
        self.name = info["name"] as! String
        self.address = info["address"] as! String
        self.octime = info["octime"] as! String
        self.rate = info["rate"] as! Int
        self.lat = info["lat"] as! Int
        self.long = info["long"] as! Int
        self.type = info["type"] as! String
        self.district = info["district"] as! String
    }
}
