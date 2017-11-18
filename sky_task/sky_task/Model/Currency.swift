//
//  Currency.swift
//  sky_task
//
//  Created by Enkhjargal Gansukh on 18/11/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import SwiftyJSON

struct Currency {
    var Code: String // GBP;
    var DecimalDigits: Int // 2;
    var DecimalSeparator: String // ".";
    var RoundingCoefficient: Int // 0;
    var SpaceBetweenAmountAndSymbol: Int // 0;
    var Symbol: String // "\U00a3";
    var SymbolOnLeft: Int // 1;
    var ThousandsSeparator: String // ",";
    
    init(json: JSON) {
        Code = json["Code"].stringValue
        DecimalDigits = json["DecimalDigits"].intValue
        DecimalSeparator = json["DecimalSeparator"].stringValue
        RoundingCoefficient = json["RoundingCoefficient"].intValue
        SpaceBetweenAmountAndSymbol = json["SpaceBetweenAmountAndSymbol"].intValue
        Symbol = json["Symbol"].stringValue
        SymbolOnLeft = json["SymbolOnLeft"].intValue
        ThousandsSeparator = json["ThousandsSeparator"].stringValue
    }
}

