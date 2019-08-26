//
//  DepartmentAdressTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/13/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class DepartmentAdressTableViewController: UITableViewController {
    let cellid = "cellid"
    let headid = "headid"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DepartmentAdressTableViewCell.self, forCellReuseIdentifier: cellid)
        tableView.register(DepartMentHeadTableViewCell.self, forCellReuseIdentifier: headid)
        tableView.backgroundColor = .white()
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let head = tableView.dequeueReusableCell(withIdentifier: headid) as! DepartMentHeadTableViewCell
        
        return head
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! DepartmentAdressTableViewCell
        cell.backgroundColor = .white()
        // Configure the cell...

        return cell
    }
 

}
