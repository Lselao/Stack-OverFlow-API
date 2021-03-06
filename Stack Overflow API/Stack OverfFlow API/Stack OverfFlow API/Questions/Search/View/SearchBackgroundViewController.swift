//
//  SearchBackGroundView.swift
//  StackOverflowApp
//
//  Created by lebose on 2020/04/08.
//  Copyright © 2020 lebose. All rights reserved.
//

import Foundation
import UIKit


// home page
// search bar
// Nav bar

class SearchBackgroundViewController: UIViewController {
    

    private let backgroundLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .darkGray
        label.text = "Stack Overflow Search"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    
// nav bar
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.blueColor()

        self.setupView()
    }
    
    
    func setupView() {
        
        self.view.addSubview(backgroundLabel)
        backgroundLabel.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor).isActive = true
        backgroundLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor).isActive = true
        
        self.view.backgroundColor = UIColor.paleGray()
    }

}
