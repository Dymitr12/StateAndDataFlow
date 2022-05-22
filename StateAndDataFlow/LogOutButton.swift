//
//  LogOutButton.swift
//  StateAndDataFlow
//
//  Created by Dymitr on 21.05.2022.
//

import SwiftUI

struct LogOutButton: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        Button(action: {
            UserDefaults.standard.removeObject(forKey: "name")
            user.isregistered.toggle()
        }) {
            Text("Log Out")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .buttonStyle()

        
    }
}

struct LogOutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogOutButton()
    }
}

struct ButtonViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
        
            .frame(width: 200, height: 60)
            .background(.blue)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 2))
    }
}

extension Button {
    func buttonStyle() -> some View {
        ModifiedContent(content: self, modifier: ButtonViewModifier())
    }
}
