//
//  Owner.swift
//  Stack OverfFlow API
//
//  Created by lebose on 2020/04/08.
//  Copyright © 2020 lebose. All rights reserved.
//

import Foundation

struct Owner: Codable {
    let reputation: Int
    let userId: Int
    let userType: UserType
    let profileImage: String
    let profileName: String
    let link: String
    let acceptRate: Int
    
    enum CodingKeys: String, CodingKey {
        
        case reputation
        case  userId = "user_id"
        case  userType = "user_type"
        case  profileImage = "profile_image"
        case  profileName = "profile_name"
        case  link
        case  acceptRate = "accept_rate"
        
    }
}

enum  UserType: String, Codable {
        case registered = "registered"
}
