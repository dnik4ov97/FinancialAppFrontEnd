//
//  BalanceView.swift
//  FinApp
//
//  Created by David Nikiforov on 12/29/22.
//

import SwiftUI

struct BalanceView: View {
    
//    @EnvironmentObject var tokens: Tokens
//    @State var balance = AccountBalanceGet()
    @StateObject var bal = Accounts()
    var body: some View {
        VStack {
            Section {
                ForEach(bal.accounts, id: \.account_id ) { account in
                    Text(account.account_id)
                    Text(account.name)
//                    Text("$\(account.balances.current)")
//                    Text("$\(account.balances.available)")
                    Text("\(account.mask)")
                    Text("\(account.subtype)")
//                    Text("\(account.official_name)")
//                    Text(account.subtype)
                }
            }
            Button("Refresh") {
                Task {
                    do {
                        let balance = try await accountsBalanceGet(email: "davdid")
//                        bal.accounts = balance.accounts
                    } catch {
                        print(error)
                    }
                }
                
            }
        }
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
    }
}
