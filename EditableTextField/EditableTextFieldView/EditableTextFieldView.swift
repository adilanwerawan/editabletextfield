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
    @ObservedObject var viewModel:EditableTextFieldViewModel
    var body: some View {
        VStack{
            TextField(
                "Enter the text you want..",
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
                    viewModel.updateWordsCount()
                }
            Text(viewModel.wordsCount)
            Spacer()
        }
        .navigationTitle("EditableTextFieldView")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(){
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var sampleText = ""
    static var previews: some View {
        EditableTextFieldView(inputText: sampleText, viewModel: EditableTextFieldViewModel())
    }
}
