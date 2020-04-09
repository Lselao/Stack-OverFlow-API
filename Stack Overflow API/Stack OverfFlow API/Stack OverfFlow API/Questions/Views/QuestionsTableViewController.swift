//
//  QuestionsTableViewController.swift
//  Stack OverfFlow API
//
//  Created by lebose on 2020/04/08.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit

class QuestionsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Search", style:.done, target: self, action: #selector(searchBtnTapped(sender:)))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


        @objc func searchBtnTapped(sender: UIBarButtonItem){
            print("testBtn")
        }

}
