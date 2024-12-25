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
    
    @MainActor
    func login(withEmail email:String,password:String) async throws{

        let http:httpClient=httpClient.shared
        
        let request=LoginRequest(email: email, password: password)
        guard let data=try? JSONEncoder().encode(request)else{
            print("Fail to encode login request")
            fatalError("login request was not proceesiable")
        }
        
        let response=try await http.post(response: LoginResponse.self, url: AppConfig.apiUrl+"account/login", data: data)
        
        if(response.isSuccess){
            StorageService.shared.storeToken(token: response.token!)
            self.isLoggedIn=true
        }
        
    }
    
    @MainActor
    func register(withEmail email:String,name:String,password:String) async throws{

        let http:httpClient=httpClient.shared
        
        let request=RegisterRequest(email: email, name:name,password: password)
        guard let data=try? JSONEncoder().encode(request)else{
            print("Fail to encode register request")
            fatalError("register request was not proceesiable")
        }
        
        _=try await http.post(response: RegisterResponse.self, url: AppConfig.apiUrl+"account/register", data: data)
        
    }
}
