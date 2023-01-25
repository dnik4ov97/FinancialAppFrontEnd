//
//  AccountBalanceGet.swift
//  FinApp
//
//  Created by David Nikiforov on 12/29/22.
//

import SwiftUI

class Balances: ObservableObject, Decodable{
    enum CodingKeys: CodingKey {
        case available, current, iso_current_code, limit
    }
    
    
    @Published var available: Double? = 0.0
    @Published var current: Double? = 0.0
//    @Published var iso_currency_code: String = ""
    //    @Published var limit: Double
    init() {}
    
//    init(avaiable: Double, current: Double) {
//        self.available = avaiable
//        self.current = current
//    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        available = try container.decode(Double?.self, forKey: .available)
        current = try container.decode(Double?.self, forKey: .current)
//        iso_currency_code = try container.decode(String.self, forKey: .iso_current_code)
    }
}

class Account: ObservableObject, Decodable, Identifiable{
    
    enum CodingKeys: CodingKey {
        case account_id, name, official_name, subtype, balances, mask
    }
    
    @Published var account_id = ""
    @Published var name = ""
    @Published var balances = Balances()
    @Published var mask = ""
    @Published var official_name: String? = ""
    @Published var subtype = ""
    
    init() {}
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(account_id, forKey: .account_id)
//        try container.encode(name, forKey: .name)
//    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        account_id = try container.decode(String.self, forKey: .account_id)
        name = try container.decode(String.self, forKey: .name)
        balances = try container.decode(Balances.self, forKey: .balances)
        mask = try container.decode(String.self, forKey: .mask)
        subtype = try container.decode(String.self, forKey: .subtype)
        official_name = try container.decode(String?.self, forKey: .official_name)
    }

}

class Accounts: Decodable, ObservableObject{
    enum CodingKeys: CodingKey {
        case accounts
    }

    @Published var accounts: [Account] = [Account]()
    init() {}

//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(accounts, forKey: .accounts)
//    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        accounts = try container.decode([Account].self, forKey: .accounts)
    }

}
    
    
func accountsBalanceGet(email: String) async throws -> [Accounts] {
    let baseURL = URL(string: "http://127.0.0.1:8080")!
        
    var accountsArray = [Accounts]()
    
    guard let encoded = try?  JSONEncoder().encode(email) else {
        print("Failed to encode user")
//        return([Accounts]())
        return accountsArray
    }
    
    print(encoded)
        
    let url = baseURL.appendingPathComponent("get_balance/")
        
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
        

    
    let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
    print(data)
    let json = try JSONDecoder().decode([Data].self, from: data)
        for x in json {
            let account = try JSONDecoder().decode(Accounts.self, from: x)
            accountsArray.append(account)
        }
    print(json)
    print(accountsArray)

    return accountsArray
}


