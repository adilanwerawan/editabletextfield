//
//  EditableTextFieldViewModel.swift
//  editabletextfield
//
//  Created by MacBook on 20/06/2022.
//

import SwiftUI

final class EditableTextFieldViewModel:ObservableObject{
    
    @Published var wordsCount = "Words count : 0"
    @Published var inputText:String = "This is a random entered text."
    
    func updateWordsCount(){
        wordsCount = "Words count : \(inputText.count)"
    }
    
    init(){
        updateWordsCount()
    }
}
