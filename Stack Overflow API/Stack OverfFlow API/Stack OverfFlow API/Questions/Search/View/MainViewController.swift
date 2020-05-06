//
//  MainViewController.swift
//  Stack OverfFlow API
//
//  Created by lebose on 2020/04/22.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var questionBody: UILabel!
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
            setQuestionBody(htmlString: (questionsInfo?.body)!)
        
        
        
//        tags
        for (index,tag) in questionsInfo!.tags.enumerated(){
            arrayTags = arrayTags + tag!
            
            if index != questionsInfo!.tags.count - 1 {
                arrayTags = arrayTags + ", "
            }
        }
        tags.text = arrayTags
            

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
    
    func setQuestionBody(htmlString: String) {

             let data = Data(htmlString.utf8)

             if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {

                 questionBody.attributedText = attributedString

                 questionBody.font = UIFont.systemFont(ofSize: 13, weight: .regular)

             }

         }
}
