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
    var tipPercentage: Double? = getDefaults(DEFAULTS_TIP_PERCENTAGE) as? Double
    return tipPercentage
}

func setDefaultTipPercentage(tipPercentage: Double) {
    setDefaults(DEFAULTS_TIP_PERCENTAGE, tipPercentage)
}

func storeLastBillAmount(billAmount: Double) {
    var now = NSDate()
    setDefaults(DEFAULTS_LAST_BILL_AMOUNT, billAmount)
    setDefaults(DEFAULTS_LAST_BILL_TIMESTAMP, now)
}

func getLastBillAmount() -> Double? {
    // gets the last bill amount if REMEMBER_BILL_THRESHOLD_SECONDS has not yet elapsed
    var lastBillTimestamp: NSDate? = getDefaults(DEFAULTS_LAST_BILL_TIMESTAMP) as? NSDate
    var lastBillAmount: Double? = nil
    if (lastBillTimestamp != nil) {
        var elapsedTime = lastBillTimestamp!.timeIntervalSinceNow
        if (elapsedTime < REMEMBER_BILL_THRESHOLD_SECONDS) {
            lastBillAmount = getDefaults(DEFAULTS_LAST_BILL_AMOUNT) as? Double
        }
    }
    return lastBillAmount
}