//
//  ContentViewModel.swift
//  xshop
//
//  Created by AlexX on 2024-12-05.
//

import Foundation
import Combine

class ContentViewModel:ObservableObject{

    @Published var isLoggedIn: Bool=false
    private var cancelables=Set<AnyCancellable>()
    
    init(){
       
        setupSubScribers()
    }
    
    private func setupSubScribers(){
        AuthService.shared.$isLoggedIn.sink{ [weak self] isLoggedIn in
            self?.isLoggedIn=isLoggedIn
        }.store(in: &cancelables)
    }
    
}
