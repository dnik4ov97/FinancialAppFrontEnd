//
//  AddBankButton.swift
//  FinApp
//
//  Created by David Nikiforov on 12/29/22.
//

import LinkKit
import SwiftUI

struct AddBankButton: View {
    
    @StateObject var tokens = Tokens()
    @StateObject var user  = CurrentUser()
    
    @State private var showLink = false
    
    var body: some View {
        VStack {
            Button(action: {
                Task{
                    user.email = "david.niki4ov97@gmail.com"
                    tokens.linkToken = await linkTokenCall()
                    showLink = true
                }
            }) {
                Text("+")
                    .font(.custom("Arial", size: 40))
            }
            .padding(.trailing, 10)
            .padding(.leading, 10)
            .foregroundColor(.white)
            .background(.green)
            .sheet(isPresented: self.$showLink,
                   onDismiss: {
                        self.showLink = false
                        Task {
                            let result = await publicTokenExchange(email: user.email, publicKey: tokens.publicToken)
                            print("result: \(result)")
                        }
                    },content:  {
                        PlaidLinkFlow(linkTokenConfiguration: createLinkTokenConfiguration(), showLink: $showLink)
                    }
            )
        }
    }
    
    private func createLinkTokenConfiguration() -> LinkTokenConfiguration {

        var configuration = LinkTokenConfiguration(
            token: tokens.linkToken,
            onSuccess: { success in
                print("public-token: \(success.publicToken) metadata: \(success.metadata)")
                tokens.publicToken = success.publicToken
                showLink = false
            }
        )

        configuration.onEvent = { event in
            print("Link Event: \(event)")
        }

        configuration.onExit = { exit in
            if let error = exit.error {
                print("exit with \(error)\n\(exit.metadata)")
            } else {
                print("exit with \(exit.metadata)")
            }
            
            showLink = false
        }

        return configuration
    }
    
}

private struct PlaidLinkFlow: View {
    @Binding var showLink: Bool
    private let linkTokenConfiguration: LinkTokenConfiguration

    init(linkTokenConfiguration: LinkTokenConfiguration, showLink: Binding<Bool>) {
        self.linkTokenConfiguration = linkTokenConfiguration
        self._showLink = showLink
    }

    var body: some View {
        let linkController = LinkController(
            configuration: .linkToken(linkTokenConfiguration)
        ) { createError in
            print("Link Creation Error: \(createError)")
            self.showLink = false
        }

        return linkController
            .onOpenURL { url in
                linkController.linkHandler?.continue(from: url)
            }
    }
}
