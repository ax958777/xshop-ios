//
//  RegistrationViewModel.swift
//  xshop
//
//  Created by AlexX on 2024-12-06.
//

import Foundation

class RegistrationViewModel:ObservableObject{
    @Published var email=""
    @Published var name=""
    @Published var password=""
    
    @MainActor
    func register() async throws {
        try await AuthService.shared.register(withEmail: email, name: name, password: password)
    }
}
