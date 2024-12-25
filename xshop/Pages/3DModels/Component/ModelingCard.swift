//
//  ModelingCard.swift
//  xshop
//
//  Created by AlexX on 2024-12-25.
//

import SwiftUI
import Kingfisher

struct ModelingCard: View {
    let modeling:Modeling
    var body: some View {
        VStack{
            // Image
            if let imageUrl=modeling.imageName{
                KFImage(URL(string:imageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:200)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    .padding()
            } else{
                Image("3dImg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:200)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    .padding()
            }
            
            //Info
            VStack(alignment: .leading, spacing: 8){
                Text(modeling.category.rawValue)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(modeling.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("$\(String(format: "%.2f", modeling.price))")
                    .font(.headline)
                
                HStack{
                    ForEach(0..<5){ index in
                        Image(systemName: index < modeling.rating ? "star.fill" :"star")
                            .foregroundColor(.yellow)
                    }
                }
                
                Button(action:{}){
                Text("Buy")
                        .frame(maxWidth:.infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}


