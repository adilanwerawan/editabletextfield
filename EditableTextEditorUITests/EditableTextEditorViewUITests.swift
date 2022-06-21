//
//  EditableTextFieldViewUITests.swift
//  EditableTextFieldUITests
//
//  Created by MacBook on 21/06/2022.
//

import XCTest

class EditableTextFieldViewUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    /// Testing if the text field is showing the initial value passed by its view model
    func testIfTextFieldIsNotEmptyIntiallyWhenViewAppears() throws {
        let app = XCUIApplication()
        if let text = app.textViews[Constants.initialTextEditorText].value as? String{
            XCTAssertFalse(text.isEmpty, "Textfield is empty intially.")
        } else {
            XCTFail("Textfield should not be empty initially.")
        }
    }
    
    /// Testing if the words count label is showing correctly
    func testIfWordsCountTextIsUpdatingCorrectly() throws {
        let app = XCUIApplication()
        let textField = app.textViews[Constants.initialTextEditorText]
        textField.tap()
        textField.press(forDuration: 1.0)
        app.menuItems["Select All"].tap()
        app.textViews[Constants.initialTextEditorText].typeText(Constants.testSampleRandomText)
        XCTAssertTrue(XCUIApplication().staticTexts[Constants.wordsCount].exists, "Problems exists in updating word count text.")
    }
}
