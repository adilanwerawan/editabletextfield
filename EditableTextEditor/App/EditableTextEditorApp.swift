//
//  editabletextfieldApp.swift
//  editabletextfield
//
//  Created by MacBook on 20/06/2022.
//

import SwiftUI

@main
struct EditableTextFieldApp: App {
    @StateObject var viewModel = EditableTextEditorViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                EditableTextEditorView(viewModel: viewModel)
            }
            // Setting navigationViewStyle as StackNavigationViewStyle
            // for correctly running into iPad
            .navigationViewStyle(.stack)
        }
    }
}
