//
//  scr03Info.swift
//  Stack OverfFlow API
//
//  Created by lebose on 2020/04/28.
//  Copyright © 2020 lebose. All rights reserved.
//

import Foundation

struct scr03Info {
   
    var creationgDate, reputation: Int?
    
    
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
