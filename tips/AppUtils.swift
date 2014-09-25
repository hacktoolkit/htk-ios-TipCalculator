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
    var tipPercentage: Double? = HTKUtils.getDefaults(DEFAULTS_TIP_PERCENTAGE) as? Double
    return tipPercentage
}

func setDefaultTipPercentage(tipPercentage: Double) {
    HTKUtils.setDefaults(DEFAULTS_TIP_PERCENTAGE, withValue: tipPercentage)
}

func storeLastBillAmount(billAmount: Double) {
    var now = NSDate()
    HTKUtils.setDefaults(DEFAULTS_LAST_BILL_AMOUNT, withValue: billAmount)
    HTKUtils.setDefaults(DEFAULTS_LAST_BILL_TIMESTAMP, withValue: now)
}

func getLastBillAmount() -> Double? {
    // gets the last bill amount if REMEMBER_BILL_THRESHOLD_SECONDS has not yet elapsed
    var lastBillTimestamp: NSDate? = HTKUtils.getDefaults(DEFAULTS_LAST_BILL_TIMESTAMP) as? NSDate
    var lastBillAmount: Double? = nil
    if (lastBillTimestamp != nil) {
        var elapsedTime = lastBillTimestamp!.timeIntervalSinceNow
        if (elapsedTime < REMEMBER_BILL_THRESHOLD_SECONDS) {
            lastBillAmount = HTKUtils.getDefaults(DEFAULTS_LAST_BILL_AMOUNT) as? Double
        }
    }
    return lastBillAmount
}

func setTheme(isLight: Bool) {
    HTKUtils.setDefaults(DEFAULTS_CURRENT_THEME, withValue: isLight)
//    setDefaults("asdfsdf", Theme.Dark)
}

func getThemeIsLight() -> Bool {
    var currentTheme: Bool? = HTKUtils.getDefaults(DEFAULTS_CURRENT_THEME) as? Bool
    var isLight = (currentTheme != nil) ? currentTheme! : DEFAULT_THEME
    return isLight
}
