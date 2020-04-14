//
//  Model.swift
//  StackOverflowApp
//
//  Created by Kudzaiishe Mhou on 2020/04/07.
//  Copyright © 2020 Kudzaiishe Mhou. All rights reserved.
//

import Foundation

struct Question: Codable {
    let items: [Item]
    let hasMore: Bool
    let quotaMax, quotaRemaining: Int

    enum CodingKeys: String, CodingKey {
        case items
        case hasMore = "has_more"
        case quotaMax = "quota_max"
        case quotaRemaining = "quota_remaining"
    }
}
