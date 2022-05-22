//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Dymitr on 18.05.2022.
//

import Foundation

final class UserManager: ObservableObject {
    @Published var isregistered = StorageManager.shared.isRegistered()
    var name = StorageManager.shared.fetchUser()
}
