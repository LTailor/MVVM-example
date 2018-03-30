//
//  Incrementor.swift
//  TestTask
//
//  Created by Dzhambulat Khasayev on 05.03.18.
//  Copyright © 2018 ReseaSoft. All rights reserved.
//

import Foundation

/**
 Provides the functions for incrementing number functionality.
 This is for AURA test task
 
 - Author:
 Dzhambulat
 - Version:
 1.0
 */
class Incrementor:IncrementorProtocol
{
    private var currentValue = 0
    private var incrementValue = 1
    
    init()
    {
        maxValue = Int.max
    }
    
    /**
     Current number. In first call it returns 0
     
     - willSet:  if current number value become greater then new max value, set it to 0
     */
    var maxValue:Int
    {
        willSet(maxValue) {
            if (currentValue > maxValue)
            {
                currentValue = 0
            }
        }
    }
    /**
     Current number. In first call it returns 0
     
     - returns:  Current number between 0 and maxValue
     */
    func getNumber() -> Int
    {
        return currentValue
    }
    
    /**
     Increments number.
     */
    func incrementNumber()
    {
        if (currentValue <= maxValue - incrementValue)
        {
            currentValue += incrementValue
        }
        else
        {
            currentValue = 0
        }
    }
    
    /**
     Set maximum value of number. If number set greater then this value, the number is setted to 0
     - parameter maximumValue: the max value of the number
     */
    func setMaximumValue(maximumValue:Int)
    {
        guard maximumValue > 0
            else
        {
            return
        }
        
        maxValue = maximumValue
    }
    
    /**
     Set start value
     */
    func setInitialValue(value:Int)
    {
        currentValue = value
    }
    
    /**
     Set increment value
     */
    func setIncrementValue(value:Int)
    {
        incrementValue = value
    }
    
}

