//
//  travis_ci_exUITests.swift
//  travis-ci-exUITests
//
//  Created by Ahmed Abdel Meguid on 9/4/18.
//  Copyright © 2018 Ahmed Abdel Meguid. All rights reserved.
//

import XCTest

class StartUITests: XCTestCase {

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        XCUIApplication().launch()

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
