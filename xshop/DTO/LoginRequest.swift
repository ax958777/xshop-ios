//
//  LoginRequest.swift
//  xshop
//
//  Created by AlexX on 2024-12-06.
//

import Foundation

struct LoginRequest:Codable{
    let email,password:String
    enum CodingKeys:String,CodingKey{
        case email,password
    }
}
