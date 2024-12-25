//
//  HomeView.swift
//  xshop
//
//  Created by AlexX on 2024-12-07.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = NavbarViewModel.shared
    var body: some View {
            ZStack {
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                    
                
                VStack {
                    
                    
                    if vm.selectedMenu == .home{
                        PlantIdentifierView()
                    }
                    
                    
                 
                }
                .zIndex(2)
                VStack{
                    HStack(alignment:.top) {
                        NavbarView()
                    }
                    Spacer()
                }
                .zIndex(3)
            }
        }
}

#Preview {
    HomeView()
}
