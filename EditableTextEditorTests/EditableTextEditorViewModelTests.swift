//
//  EditableTextFieldViewModelTests.swift
//  editabletextfieldTests
//
//  Created by MacBook on 21/06/2022.
//

import XCTest
@testable import EditableTextEditor

class EditableTextFieldViewModelTests: XCTestCase {

    var subject:EditableTextEditorViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        subject = EditableTextEditorViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        subject = nil
        super.tearDown()
    }
    
    /// Testing if viewModel is calulcating and returning the correct words count and its text
    func testIfViewModelCalculatingCorrectWordsCount() throws{
        // Given
        subject?.inputText = Constants.testSampleRandomText
        // When
        subject?.updateWordsCount()
        // Then
        XCTAssertEqual(subject?.wordsCount, Constants.wordsCount)
    }
    
    /// Testing if there is no words and text field is empty then words count should be zero
    func testIfThereIsNoWordsThenWordCountShouldBeZero() throws{
        // Given
        subject?.inputText = ""
        // When
        subject?.updateWordsCount()
        // Then
        XCTAssertEqual(subject?.wordsCount, Constants.zeroWordsCount)
    }
    
    /// Text if text field placeholder is correct
    func testIfTextFieldPlaceholderIsCorrect() throws{
        XCTAssertEqual(subject?.enterYourTextLabelValue, "Enter the text you wish :")
    }
}
