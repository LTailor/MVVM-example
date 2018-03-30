//
//  SettingsTests.swift
//  AuraTestTaskUITests
//
//  Created by Dzhambulat Khasayev on 16.03.18.
//  Copyright © 2018 ReseaSoft. All rights reserved.
//

import XCTest

class SettingsTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetMaxValue() {
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        let settingsButton = tabBarsQuery.buttons["Settings"]
        settingsButton.tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Increment"]/*[[".cells.staticTexts[\"Increment\"]",".staticTexts[\"Increment\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.pickerWheels.element.adjust(toPickerWheelValue: "1")
        
        let doneButton = app.navigationBars["AuraTestTask.SettingDetailView"].buttons["Done"]
        doneButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Current number"]/*[[".cells.staticTexts[\"Current number\"]",".staticTexts[\"Current number\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Reset"].tap()
        doneButton.tap()
        
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Max number"]/*[[".cells.staticTexts[\"Max number\"]",".staticTexts[\"Max number\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sliders.element.adjust(toNormalizedSliderPosition: 5/5000.0)
        doneButton.tap()
        tabBarsQuery.buttons["Number"].tap()
        app.staticTexts["0"].tap()
        app.staticTexts["1"].tap()
        app.staticTexts["2"].tap()
        app.staticTexts["3"].tap()
        app.staticTexts["4"].tap()
        app.staticTexts["5"].tap()
        
        
        let numberLabel = app.staticTexts["0"]
        XCTAssertTrue(numberLabel.exists)
    }
    
    func testSetIncrementValue() {
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        let settingsButton = tabBarsQuery.buttons["Settings"]
        settingsButton.tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Increment"]/*[[".cells.staticTexts[\"Increment\"]",".staticTexts[\"Increment\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.pickerWheels.element.adjust(toPickerWheelValue: "3")
        
        let doneButton = app.navigationBars["AuraTestTask.SettingDetailView"].buttons["Done"]
        doneButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Current number"]/*[[".cells.staticTexts[\"Current number\"]",".staticTexts[\"Current number\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Reset"].tap()
        doneButton.tap()
        
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Max number"]/*[[".cells.staticTexts[\"Max number\"]",".staticTexts[\"Max number\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.sliders.element.adjust(toNormalizedSliderPosition: 9/5000.0)
        doneButton.tap()
        tabBarsQuery.buttons["Number"].tap()
        app.staticTexts["0"].tap()
        app.staticTexts["3"].tap()
        
        
        let numberLabel = app.staticTexts["6"]
        XCTAssertTrue(numberLabel.exists)
    }
    
    func testResetValue() {
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        let settingsButton = tabBarsQuery.buttons["Settings"]
        settingsButton.tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Increment"]/*[[".cells.staticTexts[\"Increment\"]",".staticTexts[\"Increment\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.pickerWheels.element.adjust(toPickerWheelValue: "3")
        
        let doneButton = app.navigationBars["AuraTestTask.SettingDetailView"].buttons["Done"]
        doneButton.tap()
        
        let numberButton = tabBarsQuery.buttons["Number"]
        numberButton.tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        settingsButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Current number"]/*[[".cells.staticTexts[\"Current number\"]",".staticTexts[\"Current number\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Reset"].tap()
        doneButton.tap()
        numberButton.tap()
        
        let numberLabel = app.staticTexts["0"]
        XCTAssertTrue(numberLabel.exists)
        
    }
    
}
