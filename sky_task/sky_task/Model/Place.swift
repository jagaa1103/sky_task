//
//  Place.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 17/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import SwiftyJSON

struct Place {
    var Code: String // LCY
    var Id: Int // 13465
    var Name: String // "London City"
    var ParentId: Int // 4698
    var `Type`: String // Airport
    
    init(json: JSON) {
        Code = json["Code"].stringValue
        Id = json["Id"].intValue
        Name = json["Name"].stringValue
        ParentId = json["ParentId"].intValue
        Type = json["Type"].stringValue
    }
}
