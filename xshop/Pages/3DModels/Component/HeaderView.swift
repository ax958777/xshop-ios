//
//  HeaderView.swift
//  xshop
//
//  Created by AlexX on 2024-12-25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            Text("3D Models")
                .font(.title)
                .foregroundColor(.white)
            .padding()
        }
        .frame(height:60)
    }
}

#Preview {
    HeaderView()
}
