//
//  Constants.swift
//  editabletextfield
//
//  Created by MacBook on 21/06/2022.
//

import Foundation

enum Constants{
    static let testSampleRandomText = "This text is randomly entered for testing purpose."
    static let wordsCount = "Words count : \(testSampleRandomText.calculateWords)"
    static let zeroWordsCount = "Words count : \(0)"
    static let initialTextEditorText = "This is a random entered text."
    static let initialWordsCount = "Words count : \(initialTextEditorText.calculateWords)"
}
