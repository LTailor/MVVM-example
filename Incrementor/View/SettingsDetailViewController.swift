//
//  SettingsDetailViewController.swift
//  AuraTestTask
//
//  Created by Dzhambulat Khasayev on 14.03.18.
//  Copyright © 2018 ReseaSoft. All rights reserved.
//

import UIKit

protocol SettingsUpdateDelegate
{
    func save(value:Int, maxValue: Int, incrementValue: Int)
}

class SettingDetailViewController: UIViewController {
    
    @IBOutlet weak var incrementPicker: UIPickerView?
    @IBOutlet weak var numberLabel: UILabel?
    @IBOutlet weak var maxValueSlider: UISlider?
    @IBOutlet weak var currentValueLabel: UILabel?
    
    var delegate:SettingsUpdateDelegate?
    
    let pickerData = [1, 2, 3, 1000]
    var currentValue:Int!
    var incrementValue:Int!
    var maxValue:Int!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        
        switch (incrementValue)
        {
        case 1:
            incrementPicker?.selectRow(0, inComponent: 0, animated: false);
        case 2:
            incrementPicker?.selectRow(1, inComponent: 0, animated: false)
        case 3:
            incrementPicker?.selectRow(2, inComponent: 0, animated: false)
        case 1000:
            incrementPicker?.selectRow(3, inComponent: 0, animated: false)
            
        case .none:
            break
        case .some(_):
            break
        }
        
        maxValueSlider?.value = Float(maxValue)
        numberLabel?.text = String(maxValue)
        currentValueLabel?.text = String(currentValue)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        currentValue = 0
        currentValueLabel?.text = String(currentValue)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        maxValue = Int(sender.value)
        DispatchQueue.main.async {
            self.numberLabel?.text = String(self.maxValue)
        }
    }
    
    @IBAction func done(_ sender: Any) {
        if let incIndex = incrementPicker?.selectedRow(inComponent: 0)
        {
            incrementValue = pickerData[incIndex]
        }
        
        if let val = maxValueSlider?.value
        {
            maxValue = Int(val)
        }
        
        delegate?.save(value: currentValue, maxValue: maxValue, incrementValue: incrementValue)
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension SettingDetailViewController: UIPickerViewDataSource, UIPickerViewDelegate
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerData[row])
    }
}

