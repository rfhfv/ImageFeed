//
//  ImageFeedUITests.swift
//  ImageFeedUITests
//
//  Created by admin on 16.09.2023.
//

import XCTest
@testable import ImageFeed

final class ImageFeedUITests: XCTestCase {
    private let app = XCUIApplication()
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        app.launch()
    }
    
    func testAuth() throws {
        
        app.buttons["Authenticate"].tap()
        
        let webView = app.webViews["UnsplashWebView"]
        sleep(10)
        print(webView.buttons)
        
        let loginTextField = webView.descendants(matching: .textField).element
        sleep(10)
        
        loginTextField.tap()
        loginTextField.typeText("")
        loginTextField.swipeUp()
        
        let passwordTextField = webView.descendants(matching: .secureTextField).element
        sleep(10)
        
        passwordTextField.tap()
        passwordTextField.typeText("")
        webView.swipeUp()
        
        // Нажать кнопку логина
        let webViewsQuery = app.webViews
        webViewsQuery.buttons["Login"].tap()
        
        let tablesQuery = app.tables
        let cell = tablesQuery.children(matching: .cell).element(boundBy: 0)
        sleep(10)
        XCTAssertTrue(cell.waitForExistence(timeout: 5))
        print(app.debugDescription)
    }
    
    func testFeed() throws {
        let tablesQuery = app.tables
        
        let cell = tablesQuery.children(matching: .cell).element(boundBy: 0)
        cell.swipeUp()
        
        sleep(10)
        
        let cellToLike = tablesQuery.children(matching: .cell).element(boundBy: 1)
        
        cellToLike.buttons["likeButton"].firstMatch.tap()
        cellToLike.buttons["likeButton"].firstMatch.tap()
        
        sleep(10)
        
        cellToLike.tap()
        
        sleep(10)
        
        let image = app.scrollViews.images.element(boundBy: 0)
        // Zoom in
        image.pinch(withScale: 3, velocity: 1) // zoom in
        // Zoom out
        image.pinch(withScale: 0.5, velocity: -1)
        
        let navBackButtonWhiteButton = app.buttons["backButton"]
        navBackButtonWhiteButton.tap()
    }
    
    
    func testProfile() throws {
        let tablesQuery = app.tables
        
        let cell = tablesQuery.children(matching: .cell).element(boundBy: 0)
        
        XCTAssertTrue(cell.waitForExistence(timeout: 8))
        
        let profile = app.tabBars.buttons.element(boundBy: 1)
        profile.tap()
        
        XCTAssertTrue(app.staticTexts[""].exists)
        
        XCTAssertTrue(app.staticTexts[""].exists)
        
        app.buttons["logoutButton"].tap()
        
        app.alerts["Пока, пока!"].scrollViews.otherElements.buttons["Yes"].tap()
        sleep(10)
        XCTAssertTrue(app.buttons["Authenticate"].exists)
    }
    
}
