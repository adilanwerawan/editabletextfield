//
//  ContentView.swift
//  editabletextfield
//
//  Created by MacBook on 20/06/2022.
//

import SwiftUI
import Combine

struct EditableTextEditorView: View {
    @State var inputText:String = ""
    /// EditableTextFieldViewModel is responsible for the presentation logic
    @ObservedObject var viewModel:EditableTextEditorViewModel
    
    // MARK: Constants
    let labelTopPadding = 70.0
    let labelBottomPadding = 5.0
    let textEditorHeight = 230.0
    let vStackHorizontalPadding = 24.0
    let textEditorVerticalPadding = 10.0
    
    var body: some View {
        VStack(alignment: .leading){
            // Hardcoded text for the label over the text editor
            Text(viewModel.enterYourTextLabelValue)
                .padding(.top, labelTopPadding)
                .padding(.bottom, labelBottomPadding)
            // Text editor is responsible for containing the text
            TextEditor(
                text: $viewModel.inputText
            )
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .frame(height: textEditorHeight)
            .bordered()
            .padding([.bottom], textEditorVerticalPadding)
            .onChange(of: viewModel.inputText) { text in
                /* On text change inside the text field we are calling the updateWordsCount
                 function of the view model to update the value of the words count */
                viewModel.updateWordsCount()
            }
            /* wordsCount is the published variable so when its value will be updated through
             view model it will be notified here and update the Text */
            HStack{
                /* Giving spacer in leading and trailing to place words
                 count Text horizontally center in the view */
                Spacer()
                Text(viewModel.wordsCount)
                Spacer()
            }
            Spacer()
        }
        .padding([.leading, .trailing], vStackHorizontalPadding)
        .navigationTitle(viewModel.viewTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var sampleText = ""
    static var previews: some View {
        EditableTextEditorView(inputText: sampleText, viewModel: EditableTextEditorViewModel())
    }
}
