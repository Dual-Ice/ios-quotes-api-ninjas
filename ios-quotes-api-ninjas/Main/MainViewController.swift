//
//  MainViewController.swift
//  ios-quotes-api-ninjas
//
//  Created by  Maksim Stogniy on 22.06.2024.
//

import Foundation

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    let quotesManager = QuotesManager()
    var categories: [String] = []
    var filteredCategories: [String] = []
    
    let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = quotesManager.getCategories()
        filteredCategories = categories
        
        mainView.searchBar.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        
        navigationItem.titleView = mainView.searchBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    // Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredCategories[indexPath.row]
        return cell
    }
    
    // Table View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = filteredCategories[indexPath.row]
        let quotesViewController = QuotesViewController(category: category)
        navigationController?.pushViewController(quotesViewController, animated: true)
    }
    
    // Search Bar Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredCategories = categories
        } else {
            filteredCategories = categories.filter { $0.contains(searchText.lowercased()) }
        }
        mainView.tableView.reloadData()
    }
}
