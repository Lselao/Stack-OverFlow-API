//
//  Item.swift
//  StackOverflowApp
//
//  Created by lebose on 2020/04/08.
//  Copyright © 2020 lebose. All rights reserved.
//

import Foundation

struct Item: Codable {
    let tags: [String]
     let owner: Owner
     let isAnswered: Bool
     let viewCount, answerCount, score, lastActivityDate: Int
     let creationDate, questionID: Int
     let link: String
     let title: String
     let closedDate, acceptedAnswerID: Int?
     let closedReason: String?
     let lastEditDate, bountyAmount, bountyClosesDate: Int?

     enum CodingKeys: String, CodingKey {
         case tags, owner
         case isAnswered = "is_answered"
         case viewCount = "view_count"
         case answerCount = "answer_count"
         case score
         case lastActivityDate = "last_activity_date"
         case creationDate = "creation_date"
         case questionID = "question_id"
         case link, title
         case closedDate = "closed_date"
         case acceptedAnswerID = "accepted_answer_id"
         case closedReason = "closed_reason"
         case lastEditDate = "last_edit_date"
         case bountyAmount = "bounty_amount"
         case bountyClosesDate = "bounty_closes_date"
     }
}
