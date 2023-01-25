//
//  AccountsView.swift
//  FinApp
//
//  Created by David Nikiforov on 1/6/23.
//

import SwiftUI

struct AccountsView: View {
    
    @StateObject var accountObject = Accounts()
    
    var body: some View {
        VStack{
            AddBankButton()
            
            ForEach(accountObject.accounts) {account in
                CardView(cardName: account.official_name ?? "", lastFourDigits: account.mask, availableCredit: account.balances.available ?? 0.00, currentBalance: account.balances.current ?? 0.00, currency: "USD")
            }
        }
        .task {
            // Get Account Information
            print("Getting Account Information As Soon As the View Opens")
            do {
//                let account2 = try await accountsBalanceGet(email: "david.niki4ov97@gmail.com")
//                for ac in account2 {
//                    print(ac.accounts)
//                    for idx in ac.accounts {
//                        accountObject.accounts.append(idx)
//                        print(idx.subtype)
//                        print(idx)
//                    }
//
//                }
                let transaction = try await accountsTransactionsGet(email: "david.niki4ov97@gmail.com")
                print(transaction)

            } catch {
                print(error)
            }

        }
    }
    
}

struct AccountsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView()
    }
}
