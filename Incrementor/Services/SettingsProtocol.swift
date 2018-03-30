//
//  SettingsProtocol.swift
//  AuraTestTask
//
//  Created by Dzhambulat Khasayev on 12.03.18.
//  Copyright © 2018 ReseaSoft. All rights reserved.
//

import Foundation

/**
 
 Settings Error exception
 
 - Author:
 Dzhambulat
 - Version:
 1.0
 */
enum SettingsError: Error {
    /**
     restore settings failed
     */
    case restoreSettingsFailed
}

/**
 Provides the functions for save key/value settings.
 This is for AURA test task
 
 - Author:
 Dzhambulat
 - Version:
 1.0
 */
protocol SettingsProtocol
{
    /**
     Saves key/value pair
     - parameter name: the name of the value
     - parameter value: actual value
     */
    func saveValue<T>(name:String, value: T)
    
    /**
     Gets value name by parameter
     
     - throws: an error of type SettingsError
     - parameter name: the name of the value
     */
    func getValue(name:String) throws -> Any
}
