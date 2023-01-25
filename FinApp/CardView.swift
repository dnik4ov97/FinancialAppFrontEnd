//
//  CardView.swift
//  FinApp
//
//  Created by David Nikiforov on 1/5/23.
//

import SwiftUI

struct CardView: View {
    
    let cardName: String
    let lastFourDigits: String
    let availableCredit: Double
    let currentBalance: Double
    let currency: String
    
    var body: some View {
        Button {
            print("pressed")
        } label: {
            VStack(spacing: 40){
                HStack(spacing: 0){
                    Text("\(cardName)")
                        .foregroundColor(.white)
                        .font(.custom("Arial", size: 25))
                    Text("....\(lastFourDigits)")
                        .foregroundColor(.white)
                        .font(.custom("Arial", size: 25))

                }
                HStack(spacing: 30){
                    VStack(spacing: 0){
                        Text(availableCredit, format: .currency(code: currency))
                            .foregroundColor(.white)
                            .font(.custom("Arial", size: 25))
                        Text("Available Credit")
                            .foregroundColor(.white)
                            .font(.custom("Arial", size: 14))
                    }
                    VStack(spacing: 0){
                        Text(currentBalance, format: .currency(code: currency))
                            .foregroundColor(Color(red: 165/255, green: 36/255, blue: 36/255))
                            .font(.custom("Arial", size: 25))
                            .fontWeight(.bold)
                        Text("Current Balance")
                            .foregroundColor(.white)
                            .font(.custom("Arial", size: 14))
                    }
                }
                .padding(.bottom, 10)
            }
            .frame(width: 300, height: 150)
            .background(Color(red: 47/255, green: 57/255, blue: 81/255))
            .cornerRadius(15)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardName: "Apple", lastFourDigits: "6426", availableCredit: 1500.00, currentBalance: 1095.04, currency: "USD")
    }
}
