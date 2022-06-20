//
//  ContentView.swift
//  editabletextfield
//
//  Created by MacBook on 20/06/2022.
//

import SwiftUI

struct EditableTextFieldView: View {
    @State var inputText:String = ""
    var body: some View {
        HStack{
            TextField(
                "Enter the text you want..",
                text: $inputText
            )
            .padding()
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            Text("\(inputText.count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var sampleText = ""
    static var previews: some View {
        EditableTextFieldView(inputText: sampleText)
    }
}
