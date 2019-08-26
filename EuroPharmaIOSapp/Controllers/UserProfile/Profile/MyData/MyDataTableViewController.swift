//
//  MyDataTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/12/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MyDataTableViewController: UITableViewController {
let cellid = "cellid"
    let footid = "footid"
    let titles = ["Личная информация","Контактная информация"]
    let placeholder = [["Имя","Пол","Город"],["Телефон","E-mail"]]
    let item = [["Чингиз","Мужской","Алматы"],["+77477502321","k.chyngiz@gmail.com"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MyDataTableViewCell.self, forCellReuseIdentifier: cellid)
        tableView.register(SaveProfileTableViewCell.self, forCellReuseIdentifier: footid)
        tableView.separatorStyle = .none
        tableView.tableHeaderView?.backgroundColor = .white()
        tableView.backgroundColor = .white()
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeholder[section].count
    }

  
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! MyDataTableViewCell
        cell.textf.text = item[indexPath.section][indexPath.row]
        cell.textf.placeholder = placeholder[indexPath.section][indexPath.row]
        cell.backgroundColor = .white()
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else {
            return tableView.estimatedRowHeight
        }
    }


    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
     let foot = tableView.dequeueReusableCell(withIdentifier: footid) as! SaveProfileTableViewCell
        
        if section == 1 {
            return foot
        }
        else {
            return nil
        }
     
    }
    
    
}
