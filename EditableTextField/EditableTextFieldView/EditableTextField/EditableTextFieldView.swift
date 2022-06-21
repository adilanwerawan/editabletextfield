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
    /// EditableTextFieldViewModel is responsible for the presentation logic
    @ObservedObject var viewModel:EditableTextFieldViewModel
    
    // MARK: Constants
    let labelTopPadding = 70.0
    let textEditorHeight = 230.0
    let textEditorLeadingTrailingPadding = 24.0
    let textEditorTopPadding = 10.0
    let textEditorBottomPadding = 10.0
    
    var body: some View {
        VStack{
            /// Hardcoded text for the label over the text editor
            Text(viewModel.enterYourTextLabelValue)
                .padding(.top, labelTopPadding)
            /// Text editor is responsible for containing the text
            TextEditor(
                text: $viewModel.inputText
            )
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .frame(height: textEditorHeight)
            .bordered()
            .padding([.leading, .trailing], textEditorLeadingTrailingPadding)
            .padding(.top, textEditorTopPadding)
            .padding(.bottom,textEditorBottomPadding)
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
