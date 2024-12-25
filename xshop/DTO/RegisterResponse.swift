//
//  LoginResponse.swift
//  xshop
//
//  Created by AlexX on 2024-12-06.
//

import Foundation

struct RegisterResponse:Codable{
    let message: String?
    let token: String?
    let isSuccess: Bool
    
    enum CodingKeys:String,CodingKey{
        case message,token,isSuccess
    }
}
