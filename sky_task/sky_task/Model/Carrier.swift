//
//  Carrier.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 17/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import SwiftyJSON

struct Carrier {
    var Code: String // U2
    var DisplayCode: String // EZY
    var Id: Int // 1050;
    var ImageUrl: String // "http://s1.apideeplink.com/images/airlines/EZ.png"
    var Name: String // easyJet
    
    init(json: JSON) {
        Code = json["Code"].stringValue
        DisplayCode = json["DisplayCode"].stringValue
        Id = json["Id"].intValue
        ImageUrl = json["ImageUrl"].stringValue
        Name = json["Name"].stringValue
    }
}
