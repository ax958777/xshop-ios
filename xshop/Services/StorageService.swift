//
//  StorageService.swift
//  xshop
//
//  Created by AlexX on 2024-12-05.
//

import Foundation

class StorageService{
    static let shared=StorageService()
    func storeToken(token:String){
        let filename = "token"
        let fullPath = getDocumentsDirectory().appendingPathComponent(filename)

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: token, requiringSecureCoding: false)
            try data.write(to: fullPath)
        } catch {
            print("Store Token Error.")
        }
        
    }
    func retrieveToken()->String?{
        do {
            let filename = "token"
            let fullPath = getDocumentsDirectory().appendingPathComponent(filename)
            let data = try Data(contentsOf: fullPath)
            if let token = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSString.self, from: data)  {
                return token as String
            }
        } catch {
            print("Retrieve Token Error.")
        }
        return nil
    }
    func removeToken(){
        do {
            let filename = "token"
            let fullPath = getDocumentsDirectory().appendingPathComponent(filename)
            try FileManager.default.removeItem(atPath: fullPath.relativePath)
        } catch {
            print("Remove Token Error.")
        }
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
