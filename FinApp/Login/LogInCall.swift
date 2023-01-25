//
//  LogInCall.swift
//  FinApp
//
//  Created by David Nikiforov on 1/7/23.
//

import SwiftUI

func checkingUser() async -> Bool {
    
    let baseURL = URL(string: "http://127.0.0.1:8080")!
    
    @ObservedObject var user: CurrentUser
    
    let json: Bool
    
    do {
        
//        guard let encoded = try?  JSONEncoder().encode(user) else {
//            print("Failed to encode user")
//        }
//        
        let url = baseURL.appendingPathComponent("checkUser")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"

        let (data, _) = try await URLSession.shared.data(for: request)
        json = try JSONDecoder().decode(Bool.self, from: data)
        
    } catch {
        
        json = false
        
    }
    
    return json
}
