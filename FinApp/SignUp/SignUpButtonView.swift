//
//  SignUpButtonView.swift
//  FinApp
//
//  Created by David Nikiforov on 1/9/23.
//

import SwiftUI

struct SignUpButtonView: View {
    @ObservedObject var user: CurrentUser
    
    var body: some View {
        Button(action: {
            Task{
                print("email: \(user.email)")
                print("password: \(user.password)")
                print("firstName: \(user.firstName)")
                print("lastName: \(user.lastName)")
                print(user.accessToken)
                print(" ")
                // check if the User exists
//                let result = await checkingUser()
//                print(result)
                
                // create User
                let result = await createUser(user)
                print(result)
            }
        }) {
            Text("Sign Up")
                .foregroundColor(.white)
                .font(.custom("Arial", size: 20))
                .frame(minWidth: 300, minHeight: 50)
        }
//        .padding(.horizontal, 110)
        
//        .frame(minWidth: 320)
//        .padding(.vertical, 10)
        .background(Color(red: 79/255, green: 90/255, blue: 129/255))
        .cornerRadius(30)
        
    }
}

struct SignUpButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpButtonView(user: CurrentUser())
    }
}


func createUser(_ user: CurrentUser) async -> String {
    
    let baseURL = URL(string: "http://127.0.0.1:8080")!
    
//    var user: CurrentUser
    
//    let json: CurrentUser
    
    do {
        
        guard let encoded = try?  JSONEncoder().encode(user) else {
            print("Failed to encode user")
            return("Failed to encode user")
        }
//
        print(encoded)
        
        let url = baseURL.appendingPathComponent("createUser")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
//
        let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
        print(data)
//        json = try JSONDecoder().decode(CurrentUser.self, from: data)
        
    } catch {
        print(error)
    }
    
    return "When thru"
}
