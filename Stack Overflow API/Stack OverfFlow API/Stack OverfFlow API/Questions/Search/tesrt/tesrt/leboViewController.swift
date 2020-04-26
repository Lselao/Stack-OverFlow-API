//
//  leboViewController.swift
//  tesrt
//
//  Created by lebose on 2020/04/26.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit

class leboViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.DataSource = self
    }
    

    extension leboViewController: UITableView

}
