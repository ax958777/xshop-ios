//
//  ModelingsViewModel.swift
//  xshop
//
//  Created by AlexX on 2024-12-25.
//

import Foundation

class ModelingsViewModel:ObservableObject{
    @Published var modelings:[Modeling]=[]
    @Published var selectedCategory:ModelingCategory?
    
    init(){
        Task{
            try await loadModelings()
        }
    }
    
    @MainActor
    private func loadModelings() async throws{
        self.modelings=try await ModelingService.fetchModelings();
    }
    
    func filterModelings()->[Modeling]{
        guard let category = selectedCategory else{
            return modelings
        }
        return modelings.filter{ $0.category == category}
    }
}


