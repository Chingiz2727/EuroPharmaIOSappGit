
//
//  UserProfileTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/12/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class UserProfileTableViewController: UITableViewController {
    
    let items = [["Мои данные","Мои заказы","Статус заказа","Адрес доставки"],["Настройки","Помощь","Выход"],["Europharma гид","Адреса аптек"]]
    let headid = "headid"
    let cellid = "cellid"
    var navigator : ProfilePageNavigator?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ProfileHeaderTableViewCell.self, forCellReuseIdentifier: headid)
        tableView.register(SideMenuTableViewCell.self, forCellReuseIdentifier: cellid)
      tableView.tableFooterView = UIView()
        navigationController?.navigationBar.barTintColor = .custom_gray()

    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 140
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
        // Configure the cell...

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
