//
//  Cats_and_MoreUITests.swift
//  Cats and MoreUITests
//
//  Created by Jose Vargas on 6/3/24.
//

import XCTest

final class Cats_and_MoreUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launchEnvironment = ["-networking-success":"1"]
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let title = app.staticTexts["Shopping"]
        XCTAssert(title.exists, "Title Label not found")
        
        let downloadedCell = app.tables.staticTexts["Essence Mascara Lash Princess"]
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: downloadedCell, handler: nil)
        
        waitForExpectations(timeout: 10, handler: nil)
        
        //XCUIApplication().collectionViews.staticTexts["Essence Mascara Lash Princess"].tap()

        

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
