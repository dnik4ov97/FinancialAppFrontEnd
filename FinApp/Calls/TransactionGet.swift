//
//  TransactionGet.swift
//  FinApp
//
//  Created by David Nikiforov on 12/29/22.
//

import SwiftUI


class Transaction: ObservableObject, Decodable{
    
    enum CodingKeys: CodingKey {
        case account_id, transaction_id
    }
    
    @Published var account_id = ""
    @Published var transaction_id = ""
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        account_id = try container.decode(String.self, forKey: .account_id)
        transaction_id = try container.decode(String.self, forKey: .transaction_id)
    }

}

class Transactions: Decodable, ObservableObject {
    enum CodingKeys: CodingKey {
        case transactions
    }
    
    @Published var transactions: [Transaction] = [Transaction]()
    
    init() {}

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        transactions = try container.decode([Transaction].self, forKey: .transactions)
    }

}

struct TransactionGet {
    let baseURL = URL(string: "http://127.0.0.1:8080")!

    
    func call() async throws -> Transactions {
        
        let url = baseURL.appendingPathComponent("transaction_get/")
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        print("Response: ")
        print(response)
        print(" ")
        let json = try JSONDecoder().decode(Transactions.self, from: data)
        return json
    }

    enum Errors: Error {
        case invalidResponseEncoding
    }
}


func accountsTransactionsGet(email: String) async throws -> String {
    let baseURL = URL(string: "http://127.0.0.1:8080")!
    
    guard let encoded = try?  JSONEncoder().encode(email) else {
        print("Failed to encode user")
        return "error encoding email"
    }
    
    print(encoded)
        
    let url = baseURL.appendingPathComponent("transaction_get/")
        
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
        

    
    let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
    print(data)
    
    return "no errorr in accountsTransactionsGet"
}


struct User: Codable {
    var userName: String
    var accessToken: String
}


struct CreateUser {
    let baseURL = URL(string: "http://127.0.0.1:8080")!
    var accessToken: String = "access-sandbox-47911281-5724-43ae-87af-c18db8382f2a"
    
    func call() async throws -> String {
        
        let user = User(userName: "davidniki", accessToken: accessToken)
        
        guard let encoded = try?  JSONEncoder().encode(user) else {
            print("Failed to encode user")
            return "Failed Encoder"
        }
        
        let url = baseURL.appendingPathComponent("createUser/")
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
        print("Response: ")
        print(response)
        print(" ")
        return("It ran")
//        let json = try JSONDecoder().decode(User.self, from: data)
//        return json.accessToken
    }

    enum Errors: Error {
        case invalidResponseEncoding
    }
}
