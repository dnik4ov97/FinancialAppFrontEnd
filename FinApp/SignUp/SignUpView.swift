//
//  SignUpView.swift
//  FinApp
//
//  Created by David Nikiforov on 1/9/23.
//

import SwiftUI

struct SignUpView: View {
    @FocusState private var input: Bool
    
    @StateObject var user = CurrentUser()
    
    var body: some View {
        VStack(alignment: .center){
            
            // Title
            Text("Sign Up")
                .padding()
                .font(.custom("Arial", size: 30))
                .foregroundColor(.white)
                .fontWeight(.bold)
            
            //First Name Input
            HStack {
                Image(systemName: "person.fill")
                TextField(text: $user.firstName, label: {
                    Text("First Name").foregroundColor(.gray)
                })
                    .autocorrectionDisabled(true)
                    .submitLabel(.continue)
            }
            .modifier(SignUpFieldView())
            .padding(10)
            
            
            // Last Name Input
            HStack {
                Image(systemName: "person.fill")
                TextField(text: $user.lastName, label: {
                    Text("Last Name").foregroundColor(.gray)
                })
                    .autocorrectionDisabled(true)
                    .submitLabel(.continue)
            }
            .modifier(SignUpFieldView())
            .padding(10)
            
            
            // Email Input
            HStack {
                Image(systemName: "envelope.fill")
                TextField(text: $user.email, label: {
                    Text("Email").foregroundColor(.gray)
                })
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .submitLabel(.continue)
            }
            .modifier(SignUpFieldView())
            .padding(10)
            
            // Password Input
            HStack {
                Image(systemName: "lock.fill")
                SecureField(text: $user.password, label: {
                    Text("Password").foregroundColor(.gray)
                })
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .submitLabel(.continue)
                    .accentColor(.gray)
            }
            .modifier(SignUpFieldView())
            .padding(10)
            
            // Log In button
            SignUpButtonView(user: user)
                .padding(.top, 20)
                .padding(.bottom, 20)
            
            // ---- OR ----
//            HStack{
//                Rectangle()
//                    .fill(.white)
//                    .frame(width: 50, height: 1)
//
//                Text("or")
//                    .font(.custom("Arial", size: 15))
//                    .foregroundColor(.white)
//
//                Rectangle()
//                    .fill(.white)
//                    .frame(width: 50, height: 1)
//            }
//            .padding(.bottom, 25)
//
//            HStack {
//                Image(systemName: "apple.logo")
//                Text("Continue with Apple")
//            }
//            .frame(height: 45)
//            .padding(.horizontal, 60)
//            .foregroundColor(.white)
//            .overlay(
//                RoundedRectangle(cornerRadius: 20)
//                    .stroke(Color(red: 79/255, green: 90/255, blue: 129/255), lineWidth: 1.5)
//            )
//
//            HStack {
//                Text("Already have an account?")
//                Text("Sign In")
//                    .fontWeight(.bold)
//            }
//            .foregroundColor(.white)
//            .padding(.bottom, 80)
        }
        .background(Color(red: 34/255, green: 39/255, blue: 56/255))
        .padding(10)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}


struct SignUpFieldView: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(height: 45)
            .padding(.horizontal, 10)
            .foregroundColor(.gray)
            .background(Color(red: 255/255, green: 255/255, blue: 255/255))
            .cornerRadius(20)
    }
    
}
