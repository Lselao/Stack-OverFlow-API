//
//  TableViewCell.swift
//  Stack OverfFlow API
//
//  Created by lebose on 2020/05/08.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
       @IBOutlet weak var titleLabel: UILabel!
       @IBOutlet weak var nameLabel: UILabel!
       @IBOutlet weak var votesLabel: UILabel!
       @IBOutlet weak var answersLabel: UILabel!
       @IBOutlet weak var viewsLabel: UILabel!
       @IBOutlet weak var answeredAvatar: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
      func configureView(with question: QuestionInfo) {
                   self.titleLabel.text = question.questionTitle ?? ""
                   self.nameLabel.text = "asked by " + (question.username ?? "")
                   self.votesLabel.text = (question.votes ?? "") + " Votes"
                   self.answersLabel.text = (question.answers ?? "") + " answers"
                   self.viewsLabel.text = (question.views ?? "") + " views"
                   self.answeredAvatar.isHidden = question.questionAnswered
    
    
               }
}
