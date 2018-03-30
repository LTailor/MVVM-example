//
//  Protocols.swift
//  AuraTestTask
//
//  Created by Dzhambulat Khasayev on 12.03.18.
//  Copyright © 2018 ReseaSoft. All rights reserved.
//

import Foundation

/**
 
 Protocol for number updates
 
 - Author:
 Dzhambulat
 - Version:
 1.0
 */
protocol IncrementNumberListener
{
    /**
     Notifies listener about new value of number
     */
    func numberUpdated(number:Int)
}

/**
 
 Protocol for number settings updates
 
 - Author:
 Dzhambulat
 - Version:
 1.0
 */
protocol NumberSettingsListener
{
    /**
     Notifies listener about new settings of number
     */
    func numberSettings(value:Int, maxValue:Int, incrementValue: Int)
}
