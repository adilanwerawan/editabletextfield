//
//  editabletextfieldApp.swift
//  editabletextfield
//
//  Created by MacBook on 20/06/2022.
//

import SwiftUI

@main
struct EditableTextFieldApp: App {
    @StateObject var viewModel = EditableTextFieldViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                EditableTextFieldView(viewModel: viewModel)
            }
        }
    }
}
