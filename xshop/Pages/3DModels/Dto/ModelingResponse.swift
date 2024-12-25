//
//  ModelingResponse.swift
//  xshop
//
//  Created by AlexX on 2024-12-25.
//

import Foundation

struct ModelingResponse:Codable{
    let id:String
    let name:String
    let models:[String]?
    let price:Double
    let category:String
    
    enum CodingKeys:String,CodingKey{
        case id,name,models,price,category
    }
    
    func toModeling()->Modeling{
       
        return Modeling(id: id, name: name, price: price, rating: 5, imageName: (models != nil) ? AppConfig.apiUrl+"file/" + models![0] : nil, category: ModelingCategory(rawValue:category) ?? .products)
    }
}
