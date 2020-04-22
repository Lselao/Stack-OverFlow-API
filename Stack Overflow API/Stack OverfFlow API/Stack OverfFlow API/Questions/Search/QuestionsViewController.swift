//
//  QuestionsTableViewController.swift
//  StackOverflowApp
//
//  Created by lebose on 2020/04/08.
//  Copyright © 2020 lebose. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    var activityView: UIActivityIndicatorView?
    
    private let viewModel = QuestionsViewModel()
    private var questionsInfo = [QuestionInfo]()
    private var filteredQuestionsInfo = [QuestionInfo]()
    
    private lazy var backgroundViewController = SearchBackgroundViewController()
    
//    creating search bar
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.searchBarStyle = .default
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = .white
        searchController.searchBar.barTintColor = .white
        searchController.searchBar.returnKeyType = .search
        definesPresentationContext = true
        
        return searchController
    }()
    
//    table view colors
    private lazy var tableViewController: UITableViewController = {
        let tableViewController = UITableViewController()
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
        tableViewController.tableView.separatorStyle = .none
        tableViewController.tableView.backgroundColor = UIColor.backGroundGrey()
        tableViewController.tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "\(SearchTableViewCell.self)")
        
        return tableViewController
    }()
    
//    nav and search bar colors
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = .red
        navigationItem.searchController = searchController
        searchController.searchBar.searchTextField.backgroundColor = .white
        
        self.navigationController?.navigationBar.barTintColor = UIColor.blueColor()
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.view.backgroundColor = UIColor.backGroundGrey()
        
        self.showBackgroundView()
    }
    
// search function

    
    func fetchData(with searchText: String) {
        
        self.showActivityIndicator()
        
        viewModel.fetchQuestions(with: searchText) { (questionsInfo, error) in
            
            self.hideActivityIndicator()
            
            guard let qnsData = questionsInfo else {
                self.showErrorAlert(with: "Error", message: "Nil quetions")
                return
            }
            self.questionsInfo = qnsData
            self.filteredQuestionsInfo = qnsData
            self.tableViewController.tableView.reloadData()
        }
    }
    
}


// custom table cell spacing

extension QuestionsViewController : UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.filteredQuestionsInfo.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showQuestions", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let qnsCell = tableView.dequeueReusableCell(withIdentifier: "\(SearchTableViewCell.self)", for: indexPath) as! SearchTableViewCell
        
        qnsCell.configureView(with: filteredQuestionsInfo[indexPath.section])
        
        return qnsCell
    }
}



// MARK: Search

extension QuestionsViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
// check for user input
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            return
        }
        
        self.fetchData(with: searchText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.hideBackgroundView()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.text = ""
        searchBar.endEditing(true)
        searchBar.resignFirstResponder()
        
        self.showBackgroundView()
//filtering using input string
        self.filteredQuestionsInfo = []
        
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}


extension QuestionsViewController {
    
    func showBackgroundView() {
        self.addChild(backgroundViewController)
        self.backgroundViewController.view.frame = view.bounds
        self.view.addSubview(backgroundViewController.view)
        self.view.bringSubviewToFront(backgroundViewController.view)
        self.backgroundViewController.didMove(toParent: self)
    }
    
    func hideBackgroundView() {
        //remove backgroundView
        self.backgroundViewController.willMove(toParent: nil)
        self.backgroundViewController.view.removeFromSuperview()
        self.backgroundViewController.removeFromParent()
        
        //add table view
        self.addChild(tableViewController)
        self.tableViewController.view.frame = view.bounds
        self.view.addSubview(tableViewController.view)
        self.view.bringSubviewToFront(tableViewController.view)
        self.tableViewController.didMove(toParent: self)
        
        //reload data
        self.tableViewController.tableView.reloadData()
    }
}

extension QuestionsViewController {
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
        self.view.isUserInteractionEnabled = false
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
            self.view.isUserInteractionEnabled = true
        }
    }
}

extension QuestionsViewController {
    func showErrorAlert(with title: String, message: String) {
        let offlineAlert = UIAlertController(title: title,
                                             message: message,
                                             preferredStyle: .alert)
        offlineAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(offlineAlert, animated: true, completion: nil)
    }
}

extension UIColor {
    class func backGroundGrey() -> UIColor {
        return UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha:1.0)
    }
    
    class func textGray() -> UIColor {
        return UIColor(red: 143.0/255.0, green: 142.0/255.0, blue: 148.0/255.0, alpha:1.0)
    }
    
    class func paleGray() -> UIColor {
        return UIColor(red: 232.0/255.0, green: 235.0/255.0, blue: 237.0/255.0, alpha:1.0)
    }

    class func blueColor() -> UIColor {
        return UIColor(red: 64.0/255.0, green: 120.0/255.0, blue: 196.0/255.0, alpha:1.0)
    }
}
