//
//  Login.swift
//  xshop
//
//  Created by AlexX on 2024-12-04.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm=LoginViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("login")
                    .resizable()
                    .scaledToFit()
                    .frame(width:120,height:120)
                    .padding()
            }
        }
    }
}

#Preview {
    LoginView()
}
