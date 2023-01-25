//
//  FinAppApp.swift
//  FinApp
//
//  Created by David Nikiforov on 12/22/22.
//

import SwiftUI

@main
struct FinAppApp: App {
//    @StateObject var tokens = Tokens()
    var body: some Scene {
        WindowGroup {
//            ScrollView(.horizontal){
//                HStack {
//                    CardView(cardName: "Apple", lastFourDigits: "6426", availableCredit: 1500.00, currentBalance: 1095.04, currency: "USD")
//                    CardView(cardName: "Venture", lastFourDigits: "0390", availableCredit: 10000.00, currentBalance: 9712.30, currency: "USD")
//                    CardView(cardName: "Venture", lastFourDigits: "0390", availableCredit: 10000.00, currentBalance: 9712.30, currency: "USD")
//                }
//            }
//            CardTransactionView(cardName: "Venture")
            
//            MainView()
//                .environmentObject(tokens)
            AccountsView()
//            ZStack {
//                Color(red: 34/255, green: 39/255, blue: 56/255)
//                SignUpView()
//                    .padding()
//            }
//            .ignoresSafeArea()
//            .preferredColorScheme(.dark)

//                .environmentObject(tokens)
        }
    }
}
