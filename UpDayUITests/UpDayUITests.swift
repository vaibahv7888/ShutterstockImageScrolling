//
//  UpDayUITests.swift
//  UpDayUITests
//
//  Created by Vaibhav Bangde on 7/14/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import XCTest

class UpDayUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPicturesDownload() {
        let app = XCUIApplication()
        
        let collectionViewsQuery = app.collectionViews
        
        let collectionCell = collectionViewsQuery.children(matching: .cell).element(boundBy: 5)
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: collectionCell, handler: nil)
        
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    func testCollectionViewScroll() {
        let app = XCUIApplication()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 8).otherElements.containing(.activityIndicator, identifier:"Progress halted").element.swipeUp()
        
        let cell = collectionViewsQuery.children(matching: .cell).element(boundBy: 10)
        cell.activityIndicators["Progress halted"].swipeUp()
        cell.otherElements.containing(.activityIndicator, identifier:"Progress halted").element.swipeUp()
        
        let cell25 = collectionViewsQuery.children(matching: .cell).element(boundBy: 21)
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: cell25, handler: nil)
        
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testShutterPictureFlow() {
        let app = XCUIApplication()
        
        let collectionCellImageView = app.collectionViews.children(matching: .cell).element(boundBy: 5).otherElements.containing(.activityIndicator, identifier:"Progress halted").element
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: collectionCellImageView, handler: nil)
        
        waitForExpectations(timeout: 20, handler: nil)

        collectionCellImageView.tap()
        
        let shutterPictureView = app.otherElements.containing(.navigationBar, identifier:"UpDay.ShutterPictureView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: shutterPictureView, handler: nil)
        
        waitForExpectations(timeout: 10, handler: nil)

        shutterPictureView.tap()
        
        let navigationButtonBar = app.navigationBars["UpDay.ShutterPictureView"]
        XCTAssertFalse(navigationButtonBar.exists)
        
        let shutterPictureViewBlack = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .image).element
        
        shutterPictureViewBlack.tap()
        
        XCTAssertTrue(navigationButtonBar.exists)
        
        let backButton = navigationButtonBar.buttons["Shutter Stock"]
        backButton.tap()
        
        XCTAssertTrue(collectionCellImageView.exists)
    }
}
