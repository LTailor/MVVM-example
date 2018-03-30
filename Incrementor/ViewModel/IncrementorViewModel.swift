//
//  IncrementorViewModel.swift
//  AuraTestTask
//
//  Created by Dzhambulat Khasayev on 12.03.18.
//  Copyright © 2018 ReseaSoft. All rights reserved.
//

import Foundation

/**
 
 Incrementor View Model Protocol for MVVM pattern
 
 - Author:
 Dzhambulat
 - Version:
 1.0
 */
class IncrementorViewModel:IncrementorViewModelProtocol
{
    var incrementor: IncrementorProtocol
    var settingsService: SettingsProtocol
    
    var numberValues: NumberValues
    
    var incrementListener: IncrementNumberListener?
    var numberSettingsListener: NumberSettingsListener?
    
    init(incrementor:IncrementorProtocol, settingsService: SettingsProtocol)
    {
        self.incrementor = incrementor
        self.settingsService = settingsService
        self.numberValues = NumberValues(value: 0,maxValue: 10,incrementValue: 1)
        self.restore()
    }
    
    /**
     Increment value
     */
    func increment()
    {
        incrementor.incrementNumber()
        numberValues.value = incrementor.getNumber()
        incrementListener?.numberUpdated(number: numberValues.value)
    }
    
    /**
     Requests saved settings
     */
    func requestSettings()
    {
        numberSettingsListener?.numberSettings(value: numberValues.value, maxValue: numberValues.maxValue, incrementValue: numberValues.incrementValue)
    }
    
    /**
     Set values of settings
     */
    func setSettings(value: Int, maxValue: Int, incrementValue: Int)
    {
        numberValues.value = value
        numberValues.maxValue = maxValue
        numberValues.incrementValue = incrementValue
        
        setIncrementorValues(numberValues: numberValues)
        
        settingsService.saveValue(name: "value", value: value)
        settingsService.saveValue(name: "maxValue", value: maxValue)
        settingsService.saveValue(name: "incrementValue", value: incrementValue)
        
        incrementListener?.numberUpdated(number: incrementor.getNumber())
    }
    
    /**
     saves settings
     */
    func save()
    {
        settingsService.saveValue(name: "value", value: numberValues.value)
    }
    
    /**
     Get settings from persistent store
     */
    private func getStoredValues() throws -> NumberValues
    {
        var nv = NumberValues(value: 0, maxValue: 10 , incrementValue: 1);
        
        try nv.value = settingsService.getValue(name: "value") as! Int
        try nv.maxValue = settingsService.getValue(name: "maxValue") as! Int
        try nv.incrementValue = settingsService.getValue(name: "incrementValue") as! Int
        
        return nv
    }
    
    /**
     Restore all settings
     */
    func restore()
    {
        guard let nv = try? getStoredValues()
        else
        {
            setSettings(value: 0, maxValue: 10, incrementValue: 1)
            return
        }
        
        numberValues = nv
        
        setIncrementorValues(numberValues: numberValues)
        
        incrementListener?.numberUpdated(number: incrementor.getNumber())
    }
    
    private func setIncrementorValues(numberValues:NumberValues)
    {
        incrementor.setIncrementValue(value: numberValues.incrementValue)
        incrementor.setInitialValue(value: numberValues.value)
        incrementor.setMaximumValue(maximumValue: numberValues.maxValue)
    }
}
