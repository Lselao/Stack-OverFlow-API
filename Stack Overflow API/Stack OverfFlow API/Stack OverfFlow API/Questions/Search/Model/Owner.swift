//
//  Owner.swift
//  StackOverflowApp
//
//  Created by Kudzaiishe Mhou on 2020/04/07.
//  Copyright © 2020 Kudzaiishe Mhou. All rights reserved.
//

import Foundation

struct Owner: Codable {
    let reputation, userID: Int
    let userType: UserType
    let acceptRate: Int?
    let profileImage: String
    let displayName: String
    let link: String

    enum CodingKeys: String, CodingKey {
        case reputation
        case userID = "user_id"
        case userType = "user_type"
        case acceptRate = "accept_rate"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
    }
}

enum UserType: String, Codable {
    case doesNotExist = "does_not_exist"
    case registered = "registered"
}
