//
//  ContentView.swift
//  xshop
//
//  Created by AlexX on 2024-12-04.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm=ContentViewModel()
    var body: some View {
        Group{
            if vm.isLoggedIn{
                TabView()
            }else{
                LoginView()
            }
        }

    }
}

#Preview {
    ContentView()
}
