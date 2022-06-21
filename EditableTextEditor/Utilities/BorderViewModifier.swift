//
//  BorderViewModifier.swift
//  editabletextfield
//
//  Created by MacBook on 20/06/2022.
//

import Foundation
import SwiftUI
/// View Modifier for setting the border, rounded rectangle and the shadow to border
struct BorderViewModifier:ViewModifier {
    let padding = 5.0
    let cornerRadius = 10.0
    let opacity = 0.5
    let lineWidth = 1.0
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(Color.gray.opacity(opacity))
            )
    }
}
extension View {
    func bordered() -> some View{
        ModifiedContent(content: self, modifier: BorderViewModifier())
    }
}
