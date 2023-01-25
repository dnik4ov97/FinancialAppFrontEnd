//
//  LogInButtonView.swift
//  FinApp
//
//  Created by David Nikiforov on 1/7/23.
//

import SwiftUI

struct LogInButtonView: View {
    
    @ObservedObject var user: CurrentUser
    
    var body: some View {
        Button(action: {
            Task{
                print("\(user.email)")
                print("\(user.password)")
                let result = await checkingUser()
                print(result)
            }
        }) {
            Text("Login")
                .foregroundColor(.white)
                .font(.custom("Arial", size: 20))
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(Color(red: 79/255, green: 90/255, blue: 129/255))
        .cornerRadius(30)
        
    }
}

struct LogInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LogInButtonView(user: CurrentUser())
    }
}
