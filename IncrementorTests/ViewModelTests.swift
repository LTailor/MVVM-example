//
//  SettingsServiceTest.swift
//  AuraTestTaskTests
//
//  Created by Dzhambulat Khasayev on 14.03.18.
//  Copyright © 2018 ReseaSoft. All rights reserved.
//

import XCTest
@testable import AuraTestTask

class SettingsServiceMock:SettingsProtocol
{
    private var settings:[String:Any] = [String:Any]()
    func saveValue<T>(name:String, value: T)
    {
        settings[name] = value
    }
    
    func getValue(name:String) throws -> Any
    {
        if let val = settings[name]
        {
            return val
        }
        else
        {
            throw SettingsError.restoreSettingsFailed
        }
    }
}
class ViewModelTest: XCTestCase, IncrementNumberListener {
    
    var viewModel = IncrementorViewModel(incrementor: Incrementor(), settingsService: SettingsServiceMock())
    var number:Int = 0
    override func setUp() {
        super.setUp()
        viewModel.incrementListener = self
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func numberUpdated(number:Int)
    {
        self.number = number
    }
    
    func testIncrement() {

        viewModel.setSettings(value: 0, maxValue: 5, incrementValue: 1)
        viewModel.increment()
        viewModel.increment()
        
        XCTAssertEqual(number, 2, "Increment is not working properly")
    }
    
    func testResetValue() {

        viewModel.setSettings(value: 5, maxValue: 99, incrementValue: 3)
        viewModel.increment()
        viewModel.increment()
        viewModel.setSettings(value: 0, maxValue: 99, incrementValue: 3)
        XCTAssertEqual(number, 0, "Increment reset is not working properly")
    }
    
    func testRestoreingValue() {
        
        viewModel.setSettings(value: 9, maxValue: 919, incrementValue: 1)
        viewModel.increment()
        viewModel.increment()
        viewModel.save()
        viewModel.increment()
        viewModel.restore()
        
        XCTAssertEqual(number, 11, "restore is not working properly")
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
