//
//  QuestionInfo.swift
//  StackOverflowApp
//
//  Created by lebose on 2020/04/08.
//  Copyright © 2020 lebose. All rights reserved.
//


import Foundation

//Model given to a cell

struct QuestionInfo {
    var questionTitle, username, votes, answers, views: String?
    var questionAnswered: Bool
    var creationDate: String?
    var reputation: String?
    var profileImage: String?
    var tags: [ String?]
    
    
    init(questionTitle: String?,
         username: String?,
         votes: String?,
         answers: String?,
         views: String?,
         creationDate: String?,
         reputation: String?,
         profileImage: String?,
         tags: [String?],
         questionAnswered: Bool) {
        
        self.questionTitle = questionTitle
        self.username = username
        self.votes = votes
        self.answers = answers
        self.views = views
        self.creationDate = creationDate
        self.reputation = reputation
        self.questionAnswered = questionAnswered
        self.profileImage = profileImage
        self.tags = tags
    }
}
