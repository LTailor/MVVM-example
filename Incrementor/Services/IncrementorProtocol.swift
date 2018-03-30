//
//  IncrementorProtocol.swift
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
protocol IncrementorProtocol {
    
    var maxValue:Int { get set }
    
    /**
     Current number. In first call it returns 0
     
     - returns:  Current number between 0 and maxValue
     */
    func getNumber() -> Int
    
    /**
     Increments number.
     */
    func incrementNumber()
    
    /**
     Set maximum value of number. If number set greater then this value, the number is setted to 0
     - parameter maximumValue: the max value of the number
     */
    func setMaximumValue(maximumValue:Int)
    
    /**
     Set start value
     */
    func setInitialValue(value:Int)
    
    /**
     Set increment value
     */
    func setIncrementValue(value:Int)
}
