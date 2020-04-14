//
//  QuestionInfo.swift
//  StackOverflowApp
//
//  Created by Kudzaiishe Mhou on 2020/04/08.
//  Copyright © 2020 Kudzaiishe Mhou. All rights reserved.
//

import Foundation

//Model given to a cell

struct QuestionInfo {
    var questionTitle, username, votes, answers, views: String?
    var questionAnswered: Bool
    
    init(questionTitle: String?,
         username: String?,
         votes: String?,
         answers: String?,
         views: String?,
         questionAnswered: Bool) {
        
        self.questionTitle = questionTitle
        self.username = username
        self.votes = votes
        self.answers = answers
        self.views = views
        self.questionAnswered = questionAnswered
    }
}
