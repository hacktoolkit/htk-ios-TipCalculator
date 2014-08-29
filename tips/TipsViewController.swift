//
//  TipsViewController.swift
//  tips
//
//  Created by Jonathan Tsai on 8/21/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController {
                            
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("tips view will appear")
        paintViewPerTheme(view)
        setupTipControl(tipControl)
        var lastBillAmount: Double? = getLastBillAmount()
        if (lastBillAmount != nil) {
            billField.text = String(format: "%.2f", lastBillAmount!)
        }
        displayUpdatedTip()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("tips view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("tips view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("tips view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        displayUpdatedTip(wasEdited: true)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    func displayUpdatedTip(wasEdited: Bool = false) {
        var tipPercentage = getTipPercentage(tipControl.selectedSegmentIndex)
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip

        if (wasEdited) {
            storeLastBillAmount(billAmount)
        }
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

