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
    
    func test_Title() throws {
        let title = app.staticTexts["Shopping"]
        XCTAssert(title.exists, "Title Label not found")
    }
    
    func test_TableView_exist() throws {
        let app = XCUIApplication()
        let shoppingtableviewidCollectionView = app.collectionViews["ShoppingTableViewId"].exists
        XCTAssert(shoppingtableviewidCollectionView)
    }
    
    func test_Navigation_to_DetailView() throws {
        XCUIApplication().collectionViews.staticTexts["Essence Mascara Lash Princess"].tap()
        
        let title = app.staticTexts["Essence Mascara Lash Princess"].exists
        XCTAssertTrue(title)
    }
    
    func test_shoppingButton_tap() throws {
        XCUIApplication().collectionViews.staticTexts["Essence Mascara Lash Princess"].tap()
        let shoppingButton = app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Shopping"]
        shoppingButton.tap()
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
