//
//  CategoryFilterView.swift
//  xshop
//
//  Created by AlexX on 2024-12-25.
//

import SwiftUI

struct CategoryFilterView: View {
    @Binding var selectedCategory:ModelingCategory?
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:12) {
                ForEach(ModelingCategory.allCases, id:\.self){ category in
                    Button(action:{
                        selectedCategory=selectedCategory == category ? nil :category
                    }){
                        Text(category.rawValue)
                            .padding(.horizontal,16)
                            .padding(.vertical,8)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(selectedCategory == category ? Color.green.opacity(0.2) : Color.gray.opacity(0.1))
                            )
                            .foregroundColor(selectedCategory  == category ? .green : .primary)
                    }
                }
            }
        }
    }
}

