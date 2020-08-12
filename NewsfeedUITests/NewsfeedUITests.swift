//
//  NewsfeedUITests.swift
//  NewsfeedUITests
//
//  Created by Naveenprabhu Arumugam on 10/8/20.
//  Copyright © 2020 Naveenprabhu Arumugam. All rights reserved.
//

import XCTest

class NewsfeedUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApplicationDisplayNewsFeed() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let table = app.tables.matching(identifier: "NewsView")
        let headingCell = table.cells.element(matching: .cell, identifier: "newsHeadingCell")
        let newsListCell = table.cells.element(matching: .cell, identifier: "newsListCell")

        XCTAssertTrue(table.staticTexts.count > 0)
        XCTAssertTrue(headingCell.exists)
        XCTAssertTrue(newsListCell.exists)
    }

}
