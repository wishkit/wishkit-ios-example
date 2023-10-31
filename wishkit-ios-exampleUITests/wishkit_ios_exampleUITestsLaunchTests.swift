//
//  wishkit_ios_exampleUITestsLaunchTests.swift
//  wishkit-ios-exampleUITests
//
//  Created by Martin Lasek on 10/31/23.
//  Copyright © 2023 Martin Lasek. All rights reserved.
//

import XCTest

final class wishkit_ios_exampleUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
