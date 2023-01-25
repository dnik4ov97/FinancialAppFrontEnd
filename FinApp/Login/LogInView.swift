//
//  LogInView.swift
//  FinApp
//
//  Created by David Nikiforov on 1/7/23.
//

import SwiftUI

struct LogInView: View {
    
//    @State private var userName: String = ""
//    @State private var password: String = ""
    @FocusState private var input: Bool
    
    @StateObject var user = CurrentUser()
    
    var body: some View {
        VStack(alignment: .center){
            
            // Title
            Text("Sign In")
                .padding()
                .font(.custom("Arial", size: 30))
                .foregroundColor(.white)
            
            // Sub title
            Text("Login to your account")
                .padding()
                .font(.custom("Arial", size: 15))
                .foregroundColor(.gray)
            
            // Email Input
            HStack {
                Image(systemName: "envelope.fill")
                TextField("Email", text: $user.email)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
            }
            .modifier(LogInFieldView())
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            
            // Password Input
            HStack {
                Image(systemName: "lock.fill")
                SecureField("Password", text: $user.password)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
            }
            .modifier(LogInFieldView())
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            
            // Log In button
            LogInButtonView(user: user)
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
        .background(Color(red: 34/255, green: 39/255, blue: 56/255))
        .padding(10)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}


struct LogInFieldView: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
            .foregroundColor(Color(red: 168/255, green: 168/255, blue: 168/255))
//            .foregroundColor(.green)
//            .background(Color(red: 58/255, green: 63/255, blue: 80/255))
            .background(.white)
            .cornerRadius(20)
    }
    
    
}
