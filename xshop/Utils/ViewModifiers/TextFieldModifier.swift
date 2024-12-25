//
//  TextFieldModifier.swift
//  xshop
//
//  Created by AlexX on 2024-12-06.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content:Content)-> some View{
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal,24)
    }
}
