//
//  ViewController.swift
//  Tables
//
//  Created by lebose on 2020/04/26.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableview: UITableView!
    
    let cars = [
        "audi",
        "mazda",
        "DBO",
        "mazzaratti",
        "lambo"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
    }
    
}

// what happens when i click a row
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
    }
}
    
// display numb of rows
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
// reuse previous custom template cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = cars[indexPath.row]
        
        return cell
    }
}

