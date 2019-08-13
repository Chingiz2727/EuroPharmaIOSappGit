//
//  FavouriteTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/25/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
class FavouriteTableViewController: UITableViewController {
    let cellid = "cellid"
    let results = try! Realm().objects(FavouritesModule.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        print("resuisfd")
        tableView.register(FavouriteTableViewCell.self, forCellReuseIdentifier: cellid)
        navigator = MainPageTableNavigator(navigationController: self.navigationController!)
        navigationController?.navigationBar.barTintColor = .custom_gray()

    }
    var navigator : MainPageTableNavigator?

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
    }
    let manager = NetworkManager()
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     navigator?.detailFromFavAndBasket(id: results[indexPath.row].id)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? FavouriteTableViewCell
        cell?.module = results[indexPath.row]
    
        
        return cell ?? UITableViewCell()
    }
    

  
}
