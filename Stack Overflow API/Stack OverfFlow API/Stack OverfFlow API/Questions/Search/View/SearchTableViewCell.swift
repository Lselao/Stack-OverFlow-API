//
//  SearchTableViewCell.swift
//  StackOverflowApp
//
//  Created by lebose on 2020/04/08.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit
// constrains
// linking lables and passing data to them
// switching parent and child views
// stackviews with constrained labels

class SearchTableViewCell: UITableViewCell {
    
        // MARK: - View components
    
    private let avatar: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "chevron.right")?.withTintColor(.lightGray)
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true

        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let answeredAvatar: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "checkmark")?.withTintColor(.lightGray)
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true

        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .blue
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let nameLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let votesLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let answersLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let viewsLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let verticalAStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let verticalBStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let horizontalAStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let horizontalBStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    

        // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    

    }

}

    // MARK: - Setup view

extension SearchTableViewCell {
    func setupView() {

        self.backgroundColor = .white
        
        self.verticalAStackView.addArrangedSubview(titleLabel)
        self.verticalAStackView.addArrangedSubview(nameLabel)
        
        horizontalAStackView.addArrangedSubview(answeredAvatar)
        horizontalAStackView.addArrangedSubview(verticalAStackView)
        self.addSubview(horizontalAStackView)

        self.verticalBStackView.addArrangedSubview(votesLabel)
        self.verticalBStackView.addArrangedSubview(answersLabel)
        self.verticalBStackView.addArrangedSubview(viewsLabel)
        
        horizontalBStackView.addArrangedSubview(verticalBStackView)
        horizontalBStackView.addArrangedSubview(avatar)
        self.addSubview(horizontalBStackView)
        
        self.setupConstraints()
    }
    
    func setupConstraints() {

        horizontalAStackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
        horizontalAStackView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
        horizontalAStackView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
    
        horizontalBStackView.leadingAnchor.constraint(equalTo: self.horizontalAStackView.layoutMarginsGuide.trailingAnchor, constant: 10).isActive = true
        horizontalBStackView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
        horizontalBStackView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        horizontalBStackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
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

