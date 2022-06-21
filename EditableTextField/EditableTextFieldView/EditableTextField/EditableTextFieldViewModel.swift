//
//  EditableTextFieldViewModel.swift
//  editabletextfield
//
//  Created by MacBook on 20/06/2022.
//

import SwiftUI

/// EditableTextFieldViewModel is responsible for the presentation logic
final class EditableTextFieldViewModel:ObservableObject{
    // words count publish variable
    @Published var wordsCount = "Words count : 0"
    // Published variable for the text which user will enter into the text field
    @Published var inputText:String = "This is a random entered text."
    
    // Counting the words from the entered text by user into the textfield
    func updateWordsCount(){
        wordsCount =  "Words count : \(inputText.calculateWords)"
    }
    
    // Placeholder for the input text field
    var enterYourTextLabelValue:String{
        "Enter the text you want.."
    }
    
    var viewTitle:String{
        "Home"
    }
    
    init(){
        // Doing this to calculate the initial value of the wordsCount from initial random inputText
        updateWordsCount()
    }
}
