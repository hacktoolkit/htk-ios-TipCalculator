//
//  SettingsViewController.swift
//  tips
//
//  Created by Jonathan Tsai on 8/28/14.
//  Copyright (c) 2014 hacktoolkit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var currentThemeLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("settings view will appear")
        paintViewPerTheme(view)
        setupTipControl(defaultTipControl)
        renderThemeSwitch()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("settings view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("settings view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("settings view did disappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func renderThemeSwitch(wasChanged: Bool = false) {
        var isLight = DEFAULT_THEME
        if (wasChanged) {
            isLight = themeSwitch.on
        } else {
            isLight = getThemeIsLight()
            themeSwitch.on = isLight
        }
        currentThemeLabel.text = isLight ? THEME_LIGHT : THEME_DARK
        paintViewPerTheme(view)
    }

    @IBAction func onDonePressed(sender: AnyObject) {
        dismissThisView()
    }

    @IBAction func onThemeSwitchChanged(sender: AnyObject) {
        var isLight = themeSwitch.on
        setTheme(isLight)
        renderThemeSwitch(wasChanged: true)
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentage = getTipPercentage(defaultTipControl.selectedSegmentIndex)
        setDefaultTipPercentage(tipPercentage)
    }

    func dismissThisView() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
