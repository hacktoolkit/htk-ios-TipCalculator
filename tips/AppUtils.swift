//
//  AppUtils.swift
//  tips
//
//  Created by Jonathan Tsai on 8/28/14.
//  Copyright (c) 2014 hacktoolkit. All rights reserved.
//

import Foundation

func getTipPercentage(index: Int) -> Double {
    var tipPercentage = TIP_PERCENTAGES[index]
    return tipPercentage
}

func getDefaultTipPercentage() -> Double? {
    var possibleTipPercentage: AnyObject? = getDefaults(DEFAULTS_TIP_PERCENTAGE)
    var tipPercentage: Double? = nil
    if (possibleTipPercentage != nil) {
        tipPercentage = possibleTipPercentage as? Double
    }
    return tipPercentage
}

func setDefaultTipPercentage(tipPercentage: Double) {
    setDefaults(DEFAULTS_TIP_PERCENTAGE, tipPercentage)
}
