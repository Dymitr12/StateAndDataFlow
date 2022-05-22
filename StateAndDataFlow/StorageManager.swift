//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Dymitr on 21.05.2022.
//

import Foundation


class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let nameKey = "userName"
    
    private init() {}
    
    func save(userName: String) {
        userDefaults.set(userName, forKey: nameKey)
    }
    
    func fetchUser() -> String {
        if let userName = userDefaults.string(forKey: nameKey) {
            return userName
        }
        return ""
    }
    
    func deleteUser() {
        userDefaults.removeObject(forKey: nameKey)
    }
    
    func isRegistered() -> Bool {
        if !fetchUser().isEmpty {
            return true
        }
        return false
    }
}
