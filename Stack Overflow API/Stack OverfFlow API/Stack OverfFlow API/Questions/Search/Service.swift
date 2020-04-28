//
//  Service.swift
//  StackOverflowApp
//
//  Created by lebose on 2020/04/08.
//  Copyright © 2020 lebose. All rights reserved.
//


import Foundation


protocol QuestionService {
    func fetchQuestions(with searchText: String, completion: @escaping (Question?, NSError?) -> ())
}

class QuestionsServiceImplementation: QuestionService { // conforming to a protocol
    
    
    private static let serviceLock = NSLock()
    
    func fetchQuestions(with searchText: String, completion: @escaping (Question?, NSError?) -> Void) { // implementation of the protocol
        
        let serviceUrl =
        "https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=\(searchText)&site=stackoverflow"
        
        QuestionsServiceImplementation.serviceLock.lock()
        
        defer {
            QuestionsServiceImplementation.serviceLock.unlock()
        }
        
        guard let url = URL(string: serviceUrl) else {
            completion(nil, NSError(domain: "The URL is nil", code: 0, userInfo: nil))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, httpResponse, error) in
            
            guard error == nil else {
               return completion(nil, error as NSError?)
            }
            
            guard let responsedData = data else {
                return completion(nil, NSError(domain: "The data is nil", code: 0, userInfo: nil))
            }
           
            
            guard let _ = data,
            let response = httpResponse as? HTTPURLResponse,
            (200 ..< 300) ~= response.statusCode,
            error == nil else {
                completion(nil, error as NSError?)
                return
            }
            
            do {
                let serviceResponse = try JSONDecoder().decode(Question.self, from: responsedData)
//                print(serviceResponse)
                completion(serviceResponse, nil)
            }
            catch {
                completion(nil, NSError(domain: "decoding error", code: 1, userInfo: nil))
            }
        
        }
        
        task.resume()
    }
    
}

// extention to check what kind of data comes back from stackoverflow

//extension Data {
//
//    func hnt_description() -> String? {
//        return String(data: self, encoding: .utf8)
//    }
//
//    /// Returns valid JSON string id possible
//    func hnt_JSONString() -> NSString? {
//
//        guard let _ = try? JSONSerialization.jsonObject(with: self, options: []) else {
//            return nil // data cannot be deserialized, invalid JSON
//        }
//
//        guard let str = String(data: self, encoding: .utf8) else {
//            return nil // data to string conversation failed
//        }
//
//        // NSString conversion necessary, Swift.String is an escaped string ):
//        return NSString(string: str)
//    }
//}
