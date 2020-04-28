//
//  ViewModel.swift
//  StackOverflowApp
//
//  Created by lebose on 2020/04/08.
//  Copyright © 2020 lebose. All rights reserved.
//


import Foundation

class QuestionsViewModel {
    
//    get service protocol and its implementations
//    filter incoming data 
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
                    creationDate: "\(NSDate(timeIntervalSince1970: TimeInterval(item.creationDate)))",
                    reputation: "\(item.owner.reputation)",
                    profileImage: "\(item.owner.profileImage)",
                                                      questionAnswered: item.isAnswered))
            }
        }
        
        return questionInfoArray
    }
}
