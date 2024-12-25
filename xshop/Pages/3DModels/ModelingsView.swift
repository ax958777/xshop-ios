//
//  ModelingsView.swift
//  xshop
//
//  Created by AlexX on 2024-12-25.
//

import SwiftUI

struct ModelingsView: View {
    @StateObject private var vm=ModelingsViewModel()
    var body: some View {
        VStack{
            HeaderView()
            CategoryFilterView(selectedCategory: $vm.selectedCategory)
            ScrollView{
                LazyVStack{
                    ForEach(vm.filterModelings()){ modeling in
                        ModelingCard(modeling:modeling)
                    }
                }
                .padding()
            }
            
        }
    }
}

#Preview {
    ModelingsView()
}
