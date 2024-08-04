//
//  travis_ci_exTests.swift
//  travis-ci-exTests
//
//  Created by Ahmed Abdel Meguid on 9/4/18.
//  Copyright © 2018 Ahmed Abdel Meguid. All rights reserved.
//

import XCTest
@testable import travis_ci_ex

class StartTests: XCTestCase {

    var start: Start!
    var buttons: [UIButton]!
    var firstButton: UIButton!
    var secondButton: UIButton!

    override func setUp() {
        super.setUp()
        start = Start()
        firstButton = UIButton()
        secondButton = UIButton()
        buttons = [firstButton, secondButton]
    }

    override func tearDown() {
        start = nil
        firstButton = nil
        secondButton = nil
        buttons = nil
        super.tearDown()
    }

    func testgetIntIndex() {

        // test nil index
        XCTAssertNotNil(start.getIntIndex(for: firstButton, at: buttons))
        XCTAssertNotNil(start.getIntIndex(for: secondButton, at: buttons))
        XCTAssertNil(start.getIntIndex(for: UIButton(), at: buttons))

        // test index after remove and append again
        XCTAssertNotNil(start.getIntIndex(for: firstButton, at: buttons))
        buttons.remove(at: 0)
        XCTAssertNil(start.getIntIndex(for: firstButton, at: buttons))
        buttons.insert(firstButton, at: 0)
        XCTAssertNotNil(start.getIntIndex(for: firstButton, at: buttons))

        // test gettign integer index
        XCTAssertEqual(start.getIntIndex(for: firstButton, at: buttons), 0)
        XCTAssertEqual(start.getIntIndex(for: secondButton, at: buttons), 1)
    }

    func testdetectStatus() {

        XCTAssertEqual(start.detectStatus(index: 0), Status.invalid.rawValue)
        XCTAssertEqual(start.detectStatus(index: 1), Status.fine.rawValue)
    }
}
