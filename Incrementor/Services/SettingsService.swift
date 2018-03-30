//
//  SettingsService.swift
//  AuraTestTask
//
//  Created by Dzhambulat Khasayev on 12.03.18.
//  Copyright © 2018 ReseaSoft. All rights reserved.
//

import Foundation

/**
 Provides the functions for save key/value settings.
 This is for AURA test task
 
 - Author:
 Dzhambulat
 - Version:
 1.0
 */
class SettingsService:SettingsProtocol
{
    /**
     Saves key/value pair
     - parameter name: the name of the value
     - parameter value: actual value
     */
    func saveValue<T>(name:String, value: T)
    {
        UserDefaults.standard.set(value, forKey: name)
    }
    
    /**
     Gets value name by parameter
     
     - throws: an error of type SettingsError
     - parameter name: the name of the value
     */
    func getValue(name:String) throws -> Any
    {
        guard let value = UserDefaults.standard.object(forKey: name)
        else
        {
            throw SettingsError.restoreSettingsFailed
        }
        
        return value
    }
}
