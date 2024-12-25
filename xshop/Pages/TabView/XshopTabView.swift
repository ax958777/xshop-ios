//
//  TabView.swift
//  xshop
//
//  Created by AlexX on 2024-12-04.
//

import SwiftUI

struct XshopTabView: View {
    @State private var selectedTab=0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            PlantIdentifierView()
                .tabItem{
                    Image(systemName: selectedTab==0 ? "leaf.fill" : "leaf")
                        .environment(\.symbolVariants,selectedTab  == 0 ? .fill : .none)
                }
                .onAppear{ selectedTab=0}
                .tag(0)
            ProfileView()
                .tabItem{
                    Image(systemName: selectedTab==1 ? "person.fill" : "person")
                        .environment(\.symbolVariants,selectedTab  == 1 ? .fill : .none)
                }
                .onAppear{ selectedTab=1 }
                .tag(1)
            ModelingsView()
                .tabItem{
                    Image(systemName: selectedTab==2 ? "xbox.logo" : "xbox.logo")
                        .environment(\.symbolVariants,selectedTab  == 2 ? .fill : .none)
                }
                .onAppear{ selectedTab=2 }
                .tag(2)
        }
    }
}

#Preview {
    XshopTabView()
}
