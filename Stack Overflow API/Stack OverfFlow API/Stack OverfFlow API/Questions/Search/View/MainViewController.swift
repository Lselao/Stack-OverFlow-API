//
//  MainViewController.swift
//  Stack OverfFlow API
//
//  Created by lebose on 2020/04/22.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


    @IBOutlet weak var rep: UILabel!
    @IBOutlet weak var dp: UIImageView!
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var displayQuestionsBtn: UIButton!
    
    var Owner: Owner?
    var Item: Item?
    var questionsInfo: QuestionInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func displayQuestionBtnTapped(_ sender: Any) {
        questionTitle.text = questionsInfo?.questionTitle
        userName.text = questionsInfo?.username
        dob.text = questionsInfo?.creationDate
        rep.text = questionsInfo?.reputation
        
        
        
        let url = URL(string:
            questionsInfo?.profileImage! ??  "")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {    // execute on main thread
                self.dp.image = UIImage(data : data)
            }
        }
        task.resume()
    }
}
