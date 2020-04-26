//
//  MainViewController.swift
//  Stack OverfFlow API
//
//  Created by lebose on 2020/04/22.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var displayQuestionsBtn: UIButton!
    
    var questionsInfo: QuestionInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func displayQuestionBtnTapped(_ sender: Any) {
        questionTitle.text = questionsInfo?.questionTitle
        userName.text = questionsInfo?.username
//        rep.Int = Owner?.reputation
    }
    


}
