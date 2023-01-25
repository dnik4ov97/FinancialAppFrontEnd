//
//  TransactionView.swift
//  FinApp
//
//  Created by David Nikiforov on 12/31/22.
//

import SwiftUI

struct TransactionView: View {
    
//    @State var transactions = TransactionGet()
//    @StateObject var trans = Transactions()
    @State var userName = CreateUser()
    
    var body: some View {
        VStack {
//            Section {
//                ForEach(trans.transactions, id: \.transaction_id) { transaction in
//                    Text(transaction.transaction_id)
//                    Text(transaction.account_id)
//                }
//            }
            Button("Refresh") {
                Task {
                    do {
                        let user = try await userName.call()
                        print(user)
//                        let transactions = try await transactions.call()
//                        trans.transactions = transactions.transactions
                        //                        bal.accounts = balance.accounts
                    } catch {
                        print(error)
                    }
                }
                
            }
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
