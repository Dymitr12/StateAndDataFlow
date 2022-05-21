//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Dymitr on 18.05.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var userManager: UserManager
    
    @State private var name = ""
    @Binding var nameIsValid: Bool
    
    var body: some View {
        VStack{
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
                .padding(.leading, 30)
                Text("\(name.count)")
                    .padding(.trailing, 40)
                    .foregroundColor(nameIsValid ? .green : .red)
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
        }
    }
    private func registerUser() {
        if !name.isEmpty {
            userManager.name = name
            userManager.isregistered.toggle()
        }
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
