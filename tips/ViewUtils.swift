//
//  ViewUtils.swift
//  tips
//
//  Created by Jonathan Tsai on 8/28/14.
//  Copyright (c) 2014 hacktoolkit. All rights reserved.
//

import UIKit
import Foundation

func setupTipControl(tipControl: UISegmentedControl!) {
    for i in 0...(TIP_PERCENTAGES.count - 1) {
        var tipPercentage = TIP_PERCENTAGES[i]
        tipControl.setTitle("\(tipPercentage * 100)%", forSegmentAtIndex: i)
        var defaultTipPercentage = getDefaultTipPercentage()
        if (tipPercentage == defaultTipPercentage) {
            tipControl.selectedSegmentIndex = i
        }
    }
}