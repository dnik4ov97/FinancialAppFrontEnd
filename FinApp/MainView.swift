//
//  MainView.swift
//  FinApp
//
//  Created by David Nikiforov on 12/30/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            AccountsView()
                .tabItem{
                    Label("Add Bank", systemImage: "banknote")
                }
            BalanceView()
                .tabItem{
                    Label("Balance", systemImage: "creditcard")
                }
            TransactionView()
                .tabItem{
                    Label("Transaction", systemImage: "dollarsign")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
