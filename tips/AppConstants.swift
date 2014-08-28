//
//  AppConstants.swift
//  tips
//
//  Created by Jonathan Tsai on 8/28/14.
//  Copyright (c) 2014 hacktoolkit. All rights reserved.
//

import Foundation

let TIP_PERCENTAGES = [
    0.15,
    0.20,
    0.25,
]

let REMEMBER_BILL_THRESHOLD_SECONDS: Double = 60.0 * 10

// Keys for NSUserDefaults
let DEFAULTS_TIP_PERCENTAGE = "tip_percentage"
let DEFAULTS_LAST_BILL_AMOUNT = "last_bill_amount"
let DEFAULTS_LAST_BILL_TIMESTAMP = "last_bill_timestamp"