//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Dymitr on 18.05.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var userManger: UserManager
    
    @State private var name = ""

    var body: some View {
            VStack{
                HStack {
                    TextField("Enter your name...", text: $name)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 30)
                    Text("\(name.count)")
                        .foregroundColor(changeCounterColor())
                        .padding(.trailing)
                    
                }
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("OK")
                    }
                }
                .disabled(hideButton())
            }
    }

    private func registerUser() {
        if !name.isEmpty {
            StorageManager.shared.save(userName: name)
            userManger.name = name
            userManger.isregistered.toggle()
        }
    }
    
    private func changeCounterColor() -> Color {
        if name.count < 3 {
            return .red
        }
        return.green
    }
    
    private func hideButton() -> Bool {
        if name.count < 3 {
            return true
        }
        return false
    }
    
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
