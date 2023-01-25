//
//  LinkTokenCall.swift
//  FinApp
//
//  Created by David Nikiforov on 12/29/22.
//

import SwiftUI

struct LinkToken: Codable{
    var expiration: String
    var link_token: String
    var request_id: String
}

func linkTokenCall() async -> String {
    
    let baseURL = URL(string: "http://127.0.0.1:8080")!
    
    let json: LinkToken
    do {
        let url = baseURL.appendingPathComponent("create_link_token")
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        let (data, _) = try await URLSession.shared.data(for: request)
        json = try JSONDecoder().decode(LinkToken.self, from: data)
    } catch {
        json = LinkToken(expiration: "", link_token: "", request_id: "")
    }
    print("json: \(json)")
    print(" ")
    print("linkToken: \(json.link_token)")
    
    return json.link_token
}


//struct LinkTokenCall {
//    let baseURL = URL(string: "http://127.0.0.1:8080")!
//
//    func call() async -> LinkToken {
//        let json: LinkToken
//        do {
//            let url = baseURL.appendingPathComponent("create_link_token")
//            var request = URLRequest(url: url)
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.httpMethod = "POST"
//
//            let (data, _) = try await URLSession.shared.data(for: request)
//            json = try JSONDecoder().decode(LinkToken.self, from: data)
//        } catch {
//            json = LinkToken(expiration: "", link_token: "", request_id: "")
//        }
//        return json
//    }
//
//    enum Errors: Error {
//        case invalidResponseEncoding
//    }
//}
