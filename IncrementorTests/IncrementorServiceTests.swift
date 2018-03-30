//
//  IncrementorServiceTests.swift
//  IncrementorServiceTests
//
//  Created by Dzhambulat Khasayev on 12.03.18.
//  Copyright © 2018 ReseaSoft. All rights reserved.
//

import XCTest
@testable import AuraTestTask

class IncrementorServiceTests: XCTestCase {
    
    var incrementor:IncrementorProtocol!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        incrementor = Incrementor()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        incrementor = nil
    }
    
    func testMaxValueSetted()
    {
        incrementor.setMaximumValue(maximumValue: 300)
        
        XCTAssertEqual(incrementor.maxValue, 300, "Max value is not setted properly")
    }
    
    func testNumberIsIncremented()
    {
        incrementor.setMaximumValue(maximumValue: 0)
        incrementor.setMaximumValue(maximumValue: 20)
        
        incrementor.incrementNumber()
        incrementor.incrementNumber()
        incrementor.incrementNumber()
        
        XCTAssertEqual(incrementor.getNumber(), 3, "Increment is not working properly")
    }
    
    func testNumberIsZeroWhenMax()
    {
        incrementor.setMaximumValue(maximumValue: 0)
        incrementor.setMaximumValue(maximumValue: 3)
        
        for _ in 1...4
        {
            incrementor.incrementNumber()
        }
        
        XCTAssertEqual(incrementor.getNumber(), 0, "Increment is not cycling")
    }
    
    func testValueIsResettedProperly()
    {
        incrementor.setMaximumValue(maximumValue: 0)
        incrementor.setMaximumValue(maximumValue: 7)
        
        for _ in 1...3
        {
            incrementor.incrementNumber()
        }
        
        incrementor.setMaximumValue(maximumValue: 5)
        XCTAssertEqual(incrementor.getNumber(), 3, "Value is not correct after changing max value greater then current value")
        
        incrementor.setMaximumValue(maximumValue: 2)
        XCTAssertEqual(incrementor.getNumber(), 0, "Reset of value is not working when max is greater then current value!")
    }
    
    func testSetInitialValue()
    {
        incrementor.setInitialValue(value: 5)
        incrementor.incrementNumber()
        incrementor.incrementNumber()
        incrementor.incrementNumber()
        
        XCTAssertEqual(incrementor.getNumber(), 8, "Error when initial value is resseted")
        
        incrementor.setInitialValue(value: 0)
        XCTAssertEqual(incrementor.getNumber(), 0, "Error when initial value is resseted")
    }
    
    func testSetIncrementValue()
    {
        incrementor.setInitialValue(value: 0)
        incrementor.setIncrementValue(value: 4)
        incrementor.incrementNumber()
        incrementor.incrementNumber()
        incrementor.incrementNumber()
        incrementor.incrementNumber()
        
        XCTAssertEqual(incrementor.getNumber(), 16, "Increment value is not setted properly")
    }
    
}
