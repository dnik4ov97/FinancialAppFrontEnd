//
//  CurrentUser.swift
//  FinApp
//
//  Created by David Nikiforov on 1/9/23.
//

import SwiftUI

class CurrentUser: ObservableObject, Encodable {
    
    enum CodingKeys: CodingKey {
        case email, password, firstName, lastName, accessToken
    }
    
    @Published var email = ""
    @Published var password = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var accessToken = [String]()
    
    
    init() {}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(accessToken, forKey: .accessToken)
    }
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        account_id = try container.decode(String.self, forKey: .account_id)
//        name = try container.decode(String.self, forKey: .name)
//        balances = try container.decode(Balances.self, forKey: .balances)
//        mask = try container.decode(String.self, forKey: .mask)
//        subtype = try container.decode(String.self, forKey: .subtype)
//        official_name = try container.decode(String.self, forKey: .official_name)
//    }
}
