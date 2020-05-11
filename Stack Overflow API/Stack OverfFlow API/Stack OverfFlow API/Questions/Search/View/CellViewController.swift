//
//  CellViewController.swift
//  Stack OverfFlow API
//
//  Created by lebose on 2020/05/08.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit

class CellViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var answeredAvatar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        func configureView(with question: QuestionInfo) {
            self.titleLabel.text = question.questionTitle ?? ""
            self.nameLabel.text = "asked by " + (question.username ?? "")
            self.votesLabel.text = (question.votes ?? "") + " Votes"
            self.answersLabel.text = (question.answers ?? "") + " answers"
            self.viewsLabel.text = (question.views ?? "") + " views"
            self.answeredAvatar.isHidden = question.questionAnswered


        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
