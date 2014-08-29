//
//  Utils.swift
//  tips
//
//  Created by Jonathan Tsai on 8/28/14.
//  Copyright (c) 2014 hacktoolkit. All rights reserved.
//

import Foundation

func setDefaults(key: String, value: AnyObject) {
    var defaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject(value, forKey: key)
    defaults.synchronize()
}

func getDefaults(key: String) -> AnyObject? {
    var defaults = NSUserDefaults.standardUserDefaults()
    var value: AnyObject? = defaults.objectForKey(key)
    return value
}

func formatCurrency(amount: Double) -> String {
    var numberFormatter = NSNumberFormatter()
    numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
    var formattedAmount = numberFormatter.stringFromNumber(amount)
    return formattedAmount
}
