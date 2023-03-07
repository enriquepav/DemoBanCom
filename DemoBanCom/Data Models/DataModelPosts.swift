//
//  DataModelPosts.swift
//  DemoBanCom
//
//  Created by MAC1DIGITAL20 on 6/03/23.
//

import Foundation

struct Post: Decodable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
