//
//  LoginRequest.swift
//  xshop
//
//  Created by AlexX on 2024-12-06.
//

import Foundation

struct RegisterRequest:Codable{
    let email,name,password:String
    enum CodingKeys:String,CodingKey{
        case email,name,password
    }
}
