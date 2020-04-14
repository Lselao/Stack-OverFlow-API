//
//  ViewModel.swift
//  StackOverflowApp
//
//  Created by Kudzaiishe Mhou on 2020/04/07.
//  Copyright © 2020 Kudzaiishe Mhou. All rights reserved.
//

import Foundation

class QuestionsViewModel {
    
    private var questionsService: QuestionService = QuestionsServiceImplementation()
    
    func fetchQuestions(with searchText: String, completion: @escaping ([QuestionInfo]?, NSError?) -> ()) {
        
        questionsService.fetchQuestions(with: searchText) { (questions, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                   return completion(nil, error)
                }
                
                let qnsData = self.internalModelMapping(questions: questions)
            
                let filteredQnsData = self.filterQuestions(in: qnsData)
                
                completion(filteredQnsData, nil)
            }
        }
        
    }
    
    func filterQuestions(in questionsData: [QuestionInfo]) -> [QuestionInfo]{
        
        var questionInfoArray = [QuestionInfo]()
        questionInfoArray = questionsData
        
        for (index,_) in questionInfoArray.enumerated() { // filtering
            if index >= 20 {
                questionInfoArray.removeLast()
            }
        }
        
        return questionInfoArray
    }
    
    func internalModelMapping(questions: Question?) -> [QuestionInfo] {
        
        var questionInfoArray = [QuestionInfo]()
        questionInfoArray.reserveCapacity(20)
        
        _ = questions.map { question in
           
            question.items.map { item in
                questionInfoArray.append(QuestionInfo(questionTitle: item.title,
                                                      username: item.owner.displayName,
                                                      votes: "\(item.viewCount)",
                                                      answers: "\(item.answerCount)",
                    views: "\(item.viewCount)",
                    questionAnswered: item.isAnswered))
            }
        }
        
        return questionInfoArray
    }
}
