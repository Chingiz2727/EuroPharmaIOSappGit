//
//  ProfileTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
class ProfileTableViewController: UITableViewController {
let cellid = "cellid"
    var reload : reloadData?
    let headerid = "headerid"
    let menu = ["Мои заказы","Адреса доставки","Настройки","Выход"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SideMenuTableViewCell.self, forCellReuseIdentifier: cellid)
        tableView.register(ProfileLoginTableViewCell.self, forCellReuseIdentifier: headerid)
        tableView.backgroundColor = UIColor.custom_white()
        tableView.tableFooterView = UIView()
        tableView.bounces = false
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let layout = UICollectionViewFlowLayout()
            let my_order = MyOrdersCollectionViewController(collectionViewLayout: layout)
            self.navigationController?.pushViewController(my_order, animated: true)
        case 1:
            self.navigationController?.pushViewController(AdressTableViewController(), animated: true)

        case 2:
            self.navigationController?.pushViewController(UserSettingTableViewController(), animated: true)
        case 3:
        
            let realm = try! Realm()

            let item = realm.objects(UserData.self)
            try! realm.write {
                realm.delete(item)
                reload?.reload()
                self.navigationController?.popViewController(animated: true)
            }
        default:
            break
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menu.count
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let head = tableView.dequeueReusableCell(withIdentifier: headerid) as? ProfileLoginTableViewCell
        head?.arrow.text = ""
        return head ?? UIView()
    }
    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? SideMenuTableViewCell
        cell?.menu.textColor = .custom_gray()
        cell?.road.textColor = .custom_gray()
        cell?.imageView?.image = nil
        cell?.menu.text = menu[indexPath.row]

        return cell ?? UITableViewCell()
    }
    
}
