//
//  MainViewController.swift
//  Stack OverfFlow API
//
//  Created by lebose on 2020/04/22.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


    @IBOutlet weak var reputation: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var questionTitle: UILabel!

    
    var Owner: Owner?
    var Item: Item?
    var questionsInfo: QuestionInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         questionTitle.text = questionsInfo?.questionTitle
            userName.text = questionsInfo?.username
            date.text = questionsInfo?.creationDate
            reputation.text = questionsInfo?.reputation
            
            
            
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
