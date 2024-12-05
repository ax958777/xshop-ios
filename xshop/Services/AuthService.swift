//
//  AuthService.swift
//  xshop
//
//  Created by AlexX on 2024-12-05.
//

import Foundation

class AuthService{
    @Published var isLoggedIn:Bool
    static let shared=AuthService()
    init(){
        let token=StorageService.shared.retrieveToken()
        if(token != nil){
            self.isLoggedIn=true
        }else{
            self.isLoggedIn=false
        }
    }
}
