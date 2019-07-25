//
//  UserSettingTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RSSelectionMenu

class UserSettingTableViewController: UITableViewController {
    let cellid = "cellid"
    let menu = [["Личная информация","Номер Телефона","Изменить Пароль"],["Город","Язык"]]
    let country_array = ["Алматы","Нур-Султан","Актобе","Усть-Каменогорск","Шымкент","Караганда","Кызыорда","Уральск","Талдыкорган","Актау","Тараз"]
    let lang_array = ["Русский","Казахский","Английский"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SideMenuTableViewCell.self, forCellReuseIdentifier: cellid)
        tableView.tableFooterView = UIView()
        tableView.bounces = false
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return menu.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menu[section].count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                self.navigationController?.pushViewController(PersonalSettingViewController(), animated: true)
            case 1:
                self.navigationController?.pushViewController(EditPhoneViewController(), animated: true)
            case 2:
                self.navigationController?.pushViewController(EditPassViewController(), animated: true)
            default:
                break
            }
        default:
            switch indexPath.row {
            case 0:
                let selectionMenu = RSSelectionMenu(dataSource: self.country_array) { (cell, item, indexPath) in
                    cell.textLabel?.text = item
                }
                selectionMenu.show(style: .alert(title: "Выберите город", action: nil, height: nil), from: self)
            default:
                let selectionMenu = RSSelectionMenu(dataSource: self.lang_array) { (cell, item, indexPath) in
                    cell.textLabel?.text = item
                }
                selectionMenu.show(style: .alert(title: "Выберите язык", action: nil, height: nil), from: self)
                
            }
          break
        }
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Учетная запись"
        case 1:
            return "Региональные настройки"
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? SideMenuTableViewCell

        // Configure the cell...
        cell?.backgroundColor = .white
        cell?.menu.text = menu[indexPath.section][indexPath.row]
        cell?.menu.textColor = .custom_gray()
        return cell ?? UITableViewCell()
    }
 


}
