//
//  ViewController.swift
//  AuraTestTask
//
//  Created by Dzhambulat Khasayev on 12.03.18.
//  Copyright © 2018 ReseaSoft. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    let pickerData = [1, 2, 3, 1000]
    var maxValue:Int!
    var incrementValue:Int!
    var currentValue:Int!
    
    var viewModel:IncrementorViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.requestSettings()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SettingDetailViewController {
            
            destinationVC.delegate = self
            destinationVC.currentValue = currentValue
            destinationVC.incrementValue = incrementValue
            destinationVC.maxValue = maxValue
        }
    }
}

extension SettingsViewController: NumberSettingsListener
{
    func numberSettings(value: Int, maxValue: Int, incrementValue: Int) {
        self.maxValue = maxValue
        self.currentValue = value
        self.incrementValue = incrementValue
    }
}

extension SettingsViewController: SettingsUpdateDelegate
{
    func save(value:Int, maxValue: Int, incrementValue: Int)
    {
        viewModel.setSettings(value: value, maxValue: maxValue, incrementValue: incrementValue)
        viewModel.requestSettings()
    }
    
}
