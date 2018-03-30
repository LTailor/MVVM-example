//
//  AuraTestTaskUITests.swift
//  AuraTestTaskUITests
//
//  Created by Dzhambulat Khasayev on 12.03.18.
//  Copyright © 2018 ReseaSoft. All rights reserved.
//

import XCTest

class AuraTestTaskUITests: XCTestCase {
        
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
    
    func testNumberIncrementByTap() {
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Settings"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Current number"]/*[[".cells.staticTexts[\"Current number\"]",".staticTexts[\"Current number\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Reset"].tap()
        
        let doneButton = app.navigationBars["AuraTestTask.SettingDetailView"].buttons["Done"]
        doneButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Increment"]/*[[".cells.staticTexts[\"Increment\"]",".staticTexts[\"Increment\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.pickerWheels.element.adjust(toPickerWheelValue: "1")
        doneButton.tap()
        tabBarsQuery.buttons["Number"].tap()
        app.staticTexts["0"].tap()
        app.staticTexts["1"].tap()
        app.staticTexts["2"].tap()
        
        let numberLabel = app.staticTexts["3"]
        XCTAssertTrue(numberLabel.exists)
        
    }
}
