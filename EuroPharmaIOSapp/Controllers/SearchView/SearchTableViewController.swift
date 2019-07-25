//
//  SearchTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController,UISearchBarDelegate {
    let cellid = "cellid"
    let searcher = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.bounces = true
        tableView.register(SearchItemTableViewCell.self, forCellReuseIdentifier: cellid)
        searcher.delegate = self
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.tableView.addSubview(searcher)
        searcher.backgroundColor = .custom_green()
        searcher.placeholder = "Введите название"
        
        searcher.showsCancelButton = true
        searcher.searchBarStyle = .prominent
        searcher.barStyle = .default
        return searcher
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()

    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? SearchItemTableViewCell

        // Configure the cell...

        return cell ?? UITableViewCell()
    }
 

  
}
