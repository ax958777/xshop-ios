//
//  ModelingService.swift
//  xshop
//
//  Created by AlexX on 2024-12-25.
//

import Foundation

struct ModelingService{
    static func fetchModelings() async throws -> [Modeling]{
        let http:httpClient=httpClient.shared
        let response=try await http.get(response:[ModelingResponse].self,url:AppConfig.apiUrl+"modeling/all")
        return response.map({try! $0.toModeling()})
    }
}
