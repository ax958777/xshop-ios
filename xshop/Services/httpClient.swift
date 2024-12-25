//
//  httpClient.swift
//  xshop
//
//  Created by AlexX on 2024-12-06.
//

import Foundation


enum httpMethod {
    case get
    case post
    case patch
    case put
    case delete
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .patch:
            return "PATCH"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
}

enum NetworkError: Error,LocalizedError {
    
    case invalidResponse
    case badUrl
    case decodingError
    case badToken
    
    var errorDescription:String?{
        
        switch self{
            
        case .invalidResponse:
            return "The response of network call is invalid."
            
        case  .badUrl:
            return "The Url is invalid."
            
        case .decodingError:
            return "Decoding Error."
            
        case .badToken:
            return "Token Invalid."
        }
    }
}


class httpClient {
    
    static let shared=httpClient()
    
    func post<T: Codable>(response: T.Type,url:String,data:Data,isSecure: Bool = false) async throws -> T {
        let response = try await load(response: response,url: url,method: .post,data: data,isSecure: isSecure)
        return response
    }
    func get<T: Codable>(response: T.Type,url:String,data:Data? = nil,isSecure: Bool = false) async throws -> T {
        let response = try await load(response: response,url: url,method: .get,data: data,isSecure: isSecure)
        return response
    }
    func put<T: Codable>(response: T.Type,url:String,data:Data,isSecure: Bool = false) async throws -> T {
        let response = try await load(response: response,url: url,method: .put,data: data,isSecure: isSecure)
        return response
    }
    func patch<T: Codable>(response: T.Type,url:String,data:Data,isSecure: Bool = false) async throws -> T {
        let response = try await load(response: response,url: url,method: .patch,data: data,isSecure: isSecure)
        return response
    }
    func delete<T: Codable>(response: T.Type,url:String,data:Data,isSecure: Bool = false) async throws -> T {
        let response = try await load(response: response,url: url,method: .delete,data: data,isSecure: isSecure)
        return response
    }
    
    private func load<T: Codable>(response: T.Type,url:String,method: httpMethod,data:Data?=nil,isSecure: Bool = false) async throws -> T {
        
        var request = URLRequest(url: URL(string:url)!)
        
        switch method {
            
        case .post:
            request.httpMethod = method.name
            request.httpBody = data
        case .get:
            request = URLRequest(url: URL(string:url)!)
        case .patch:
            request.httpMethod = method.name
            request.httpBody = data
        case .put:
            request.httpMethod = method.name
            request.httpBody = data
        case .delete:
            request.httpMethod = method.name
            request.httpBody = data
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        
        let token=StorageService.shared.retrieveToken()
        if(isSecure){
            
            if token == nil {
                throw NetworkError.badToken
            }
            configuration.httpAdditionalHeaders = ["Content-Type": "application/json","Authorization": "Bearer " + token!]
            
        }
        let session = URLSession(configuration: configuration)
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode)
        else {
            if(isSecure)  {
                if(httpResponse.statusCode==401){
                    throw NetworkError.badToken
                }else{
                    throw NetworkError.invalidResponse
                }
            }else{
                throw NetworkError.invalidResponse
            }
        }
        
        
        guard let result = try? JSONDecoder().decode(T.self, from: data) else {

            throw NetworkError.decodingError
        }
        
        return result
        
        
    }
}
