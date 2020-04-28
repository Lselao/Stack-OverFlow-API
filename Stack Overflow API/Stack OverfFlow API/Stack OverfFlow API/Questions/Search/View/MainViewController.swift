//
//  MainViewController.swift
//  Stack OverfFlow API
//
//  Created by lebose on 2020/04/22.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var SCR03: UITableView!
    
    
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var displayQuestionsBtn: UIButton!
    
    var Item: Item?
    var questionsInfo: QuestionInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        SCR03.delegate = self
//        SCR03.dataSource = self
    }
    
    
    @IBAction func displayQuestionBtnTapped(_ sender: Any) {
        questionTitle.text = questionsInfo?.questionTitle
        userName.text = questionsInfo?.username
//        dob = questionsInfo?.creationgDate
    }
    


}
//
//extension MainViewController : UITableViewDelegate {
//
//}
//
//extension MainViewController : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}
