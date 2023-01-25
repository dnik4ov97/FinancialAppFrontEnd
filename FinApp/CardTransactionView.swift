//
//  SwiftUIView.swift
//  FinApp
//
//  Created by David Nikiforov on 1/5/23.
//

import SwiftUI

struct Trans: Identifiable, Hashable {
    let date: Date
    let category: String
    let amount: Double
    let id = UUID()
    
}

struct CardTransactionView: View {
    
    let cardName: String
    
    let formatter = DateFormatter()
    
//    formatter.dateFormat = "YYYY-MM-DD"
    
    
    var trans = [
        Trans(date: Date.now, category: "Rent", amount: 2754),
        Trans(date: Date.now, category: "Water Bill", amount: 34.99),
        Trans(date: Date.now, category: "Valet Trash", amount: 25),
        Trans(date: Date.now, category: "Trash", amount: 38.85),
        Trans(date: Date.now, category: "Sewer", amount: 64.32),
        Trans(date: Date.now, category: "Apple", amount: 150.00)
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Title of Table
            Text("\(cardName)")
                .foregroundColor(.white)
                .font(.custom("Arial", size: 25))
                .fontWeight(.bold)
                .padding(.top, 10)
            
            // Table
            Grid(alignment: .center, horizontalSpacing: 30, verticalSpacing: 5) {
                GridRow {
                    Text("Data")
                    Text("Category")
                    Text("Amount")
                 }
                .foregroundColor(.white)
                .font(.custom("Arial", size: 12))
                
                ForEach(trans, id: \.self) {tran in
                    GridRow {
                        Text(tran.date, format: .dateTime.month().day())
                            .foregroundColor(Color(red: 213/255, green: 213/255, blue: 213/255))
                        Text(tran.category)
                            .foregroundColor(Color(red: 213/255, green: 213/255, blue: 213/255))
                        Text(tran.amount, format: .currency(code: "USD"))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                        .font(.custom("Arial", size: 15))
                    
                    Divider()
                        .frame(height: 1)
                        .background(.white)
                }
            }
            
            // Total Amount
            Text (sum(trans: trans), format: .currency(code: "USD"))
                .foregroundColor(.white)
                .font(.custom("Arial", size: 25))
                .fontWeight(.bold)
                .padding(10)
                .background(Color(red: 255/255, green: 100/255, blue: 78/255))
                .cornerRadius(5)
        }
        .padding(10)
        .background(Color(red: 47/255, green: 57/255, blue: 81/255))
        .cornerRadius(20)
    }
}

func sum (trans: [Trans]) -> Double {
    var total = 0.0
    for tran in trans {
        total += tran.amount
    }
    return total
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CardTransactionView(cardName: "Venture")
    }
}
