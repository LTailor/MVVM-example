//
//  IncrementorViewModelProtocol.swift
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
protocol IncrementorViewModelProtocol
{
    var numberValues: NumberValues { get set }
    var incrementor:IncrementorProtocol { get set }
    var settingsService:SettingsProtocol { get set }
    
    /**
     Increment value
     */
    func increment()
    
    /**
     Requests saved settings
     */
    func requestSettings()
    
    /**
     Set values of settings
     */
    
    func setSettings(value: Int, maxValue: Int, incrementValue: Int)
    
    /**
     saves settings
     */
    func save()
    
    /**
     Restore all settings
     */
    func restore()
}
