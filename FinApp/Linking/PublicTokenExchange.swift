//
//  PublicTokenExchange.swift
//  FinApp
//
//  Created by David Nikiforov on 12/29/22.
//

import SwiftUI

struct EmailWithAccess: Codable {
    var email: String
    var publicKey: String
}



func publicTokenExchange(email: String ,publicKey: String) async -> Bool {
    
    let baseURL = URL(string: "http://127.0.0.1:8080")!
    
    let emailAccess = EmailWithAccess(email: email, publicKey: publicKey)
    
//    let json: AccessToken
    do {
        
        guard let encoded = try?  JSONEncoder().encode(emailAccess) else {
            print("Failed to encode user")
            return false
        }
        
        let url = baseURL.appendingPathComponent("item_public_token_exchange/")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
        print("data: \(data)")

    } catch {
        return false
    }

    return true
}


