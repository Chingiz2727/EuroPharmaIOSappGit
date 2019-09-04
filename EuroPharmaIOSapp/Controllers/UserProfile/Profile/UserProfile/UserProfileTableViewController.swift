
//
//  UserProfileTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/12/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class UserProfileTableViewController: UITableViewController {
    
    let items = [["Мои данные","Мои заказы","Статус заказа","Адрес доставки"],["Настройки","Выход"],["Europharma гид","Адреса аптек"]]
    let headid = "headid"
    let cellid = "cellid"
    var navigator : ProfilePageNavigator?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ProfileHeaderTableViewCell.self, forCellReuseIdentifier: headid)
        tableView.register(SideMenuTableViewCell.self, forCellReuseIdentifier: cellid)
        tableView.tableFooterView = UIView()
        navigationController?.navigationBar.barTintColor = .custom_gray()
        tableView.backgroundColor = .white()
       
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false

        navigationItem.hidesBackButton = true
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 87
        }
        else {
            return 20
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigator = ProfilePageNavigator(navigationController: self.navigationController!)
        navigator?.userSettings(indexpath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let head = tableView.dequeueReusableCell(withIdentifier: headid) as! ProfileHeaderTableViewCell
            return head
        }
        else {
            let view = UIView()
            view.backgroundColor = .custom_white()
            self.view.addSubview(view)
            return view
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return items.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! SideMenuTableViewCell
        cell.menu.text = items[indexPath.section][indexPath.row]
        cell.road.isHidden = false
        cell.backgroundColor = .white()
        // Configure the cell...

        return cell
    }
 


}
