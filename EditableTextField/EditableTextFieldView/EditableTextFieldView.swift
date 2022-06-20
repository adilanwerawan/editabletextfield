//
//  ContentView.swift
//  editabletextfield
//
//  Created by MacBook on 20/06/2022.
//

import SwiftUI
import Combine

struct EditableTextFieldView: View {
    @State var inputText:String = ""
    // EditableTextFieldViewModel is responsible for the presentation logic
    @ObservedObject var viewModel:EditableTextFieldViewModel
    var body: some View {
        VStack{
            TextField(
                viewModel.placeholderForTextField,
                text: $viewModel.inputText
            )
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .frame(height: 30.0)
                .bordered()
                .padding([.leading, .trailing], 24.0)
                .padding(.top, 80.0)
                .padding(.bottom, 50.0)
                .onChange(of: viewModel.inputText) { text in
                    /* On text change inside the text field we are calling the updateWordsCount
                     function of the view model to update the value of the words count */
                    viewModel.updateWordsCount()
                }
            /* wordsCount is the published variable so when its value will be updated through
             view model it will be notified here and update the Text */
            Text(viewModel.wordsCount)
            Spacer()
        }
        .navigationTitle(viewModel.viewTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var sampleText = ""
    static var previews: some View {
        EditableTextFieldView(inputText: sampleText, viewModel: EditableTextFieldViewModel())
    }
}
