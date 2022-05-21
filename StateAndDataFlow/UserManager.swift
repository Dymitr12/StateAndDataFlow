//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Dymitr on 18.05.2022.
//

import Foundation
import UIKit

final class UserManager: ObservableObject {
    @Published var isregistered = false
    var name = ""
    
    public func logOut() {
        isregistered.toggle()
        name = ""
    }
    
    var nameIsValid: Bool {
        name.count >= 3
    }
}
