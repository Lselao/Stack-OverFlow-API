//
//  MainViewController.swift
//  Stack OverfFlow API
//
//  Created by lebose on 2020/04/22.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let url = "https://api.stackexchange.com/2.2/questions?pagesize=20&order=desc&sort=activity&tagged=s wift%203&site=stackoverflow"
    
    @IBOutlet weak var dp: UIImageView!
    @IBOutlet weak var reputation: UILabel!
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
//        reputation.text = Owner?.reputation
       
    
        
    }

}


//    let getImgFromUrl = URLSession(configuration: .default).dataTask(with: url!) {(data, response, error) in
//               if let error = error {
//                   print("Error Occurred: \(error)")
//               } else {
//                   if (response as? HTTPURLResponse) != nil {
//                       DispatchQueue.main.async {
//                           self.dp.image = UIImage(data : data!)
//                       }
//                   }
//               }
//           }
//

