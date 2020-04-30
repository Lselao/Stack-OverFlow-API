//
//  MainViewController.swift
//  Stack OverfFlow API
//
//  Created by lebose on 2020/04/22.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


    @IBOutlet weak var tags: UILabel!
    @IBOutlet weak var reputation: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var questionTitle: UILabel!

    var questionsInfo: QuestionInfo?
    var arrayTags = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         questionTitle.text = questionsInfo?.questionTitle
            userName.text = questionsInfo?.username
            date.text = "asked by " + (questionsInfo?.creationDate ?? "")
            reputation.text = questionsInfo?.reputation
        
        
        
//        tags
        for (index,tag) in questionsInfo!.tags.enumerated(){
            arrayTags = arrayTags + tag!
            
            if index != questionsInfo!.tags.count - 1 {
                arrayTags = arrayTags + ", "
            }
        }
        tags.text = arrayTags
            
            
        
//        date
//        let formatter: DateFormatter = {
//
//            let formatter = DateFormatter()
//                   formatter.timeZone = .current
//                   formatter.dateStyle = .full
//                   formatter.locale = .current
//
//            return formatter
//        let date = Date()
//        date.text = formatter.string(from: date)
        
        
        

        let url = URL(string:
            questionsInfo?.profileImage! ??  "")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else { return }
                
            DispatchQueue.main.async() {
                self.profileImage.image = UIImage(data : data)
            }
        }
        task.resume()
    }
}
