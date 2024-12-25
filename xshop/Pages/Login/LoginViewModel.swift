//
//  LoginViewModel.swift
//  xshop
//
//  Created by AlexX on 2024-12-05.
//

import Foundation

class LoginViewModel:ObservableObject{
    @Published var email=""
    @Published var password=""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail:email, password:password)
    }
}
