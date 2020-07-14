//
//  SettingsViewController.swift
//  ZexiLiu-Lab4
//
//  Created by Mike Liu on 7/14/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    
    let defaults = UserDefaults.standard
    var adultEnabled: Bool?
    var numPerQuery: Int?
    @IBOutlet weak var switchBar: UISwitch!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adultEnabled = defaults.bool(forKey: "isAdult")
        if(adultEnabled == nil) {
            adultEnabled = false
            defaults.set(self.adultEnabled, forKey: "isAdult")
        }
        switchBar.isOn = adultEnabled!
        self.numPerQuery = defaults.integer(forKey: "numPerQuery")
        if(numPerQuery == nil || numPerQuery! <= 0) {
            numPerQuery = 20
            defaults.set(self.numPerQuery, forKey: "numPerQuery")
        }
        textField.text = String(numPerQuery!)
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func adultBarChanged(_ sender: Any) {
        self.adultEnabled = !self.adultEnabled!
        defaults.set(self.adultEnabled, forKey: "isAdult")
    }
    
    @IBAction func numChanged(_ sender: Any) {
        let num = Int(textField.text!)
        if(num != nil) {
            defaults.set(num, forKey: "numPerQuery")
        }
    }
}
