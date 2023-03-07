//
//  DataModelUsers.swift
//  DemoBanCom
//
//  Created by MAC1DIGITAL20 on 6/03/23.
//

import Foundation

struct Users: Decodable {
    let Users : [User]
}

// MARK: - User
struct User: Decodable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Decodable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Decodable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Decodable {
    let name, catchPhrase, bs: String
}
