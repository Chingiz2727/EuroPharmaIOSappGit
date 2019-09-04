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
    let menu = ["Уведомление","Номер Телефона","Изменить Пароль","Город","Язык"]
    let country_array = ["Алматы","Нур-Султан","Актобе","Усть-Каменогорск","Шымкент","Караганда","Кызыорда","Уральск","Талдыкорган","Актау","Тараз"]
    let lang_array = ["Русский","Казахский","Английский"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SideMenuTableViewCell.self, forCellReuseIdentifier: cellid)
        tableView.tableFooterView = UIView()
        tableView.bounces = false
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
            switch indexPath.row {
            case 0:
                break
//                self.navigationController?.pushViewController(PersonalSettingViewController(), animated: true)
            case 1:
                
                self.navigationController?.pushViewController(WritePhoneViewController(), animated: true)
            case 2:
                self.navigationController?.pushViewController(EditPassViewController(), animated: true)
            case 3:
                let selectionMenu = RSSelectionMenu(dataSource: self.country_array) { (cell, item, indexPath) in
                    cell.textLabel?.text = item
                }
                selectionMenu.show(style: .alert(title: "Выберите город", action: nil, height: nil), from: self)
            case 4:
                let selectionMenu = RSSelectionMenu(dataSource: self.lang_array) { (cell, item, indexPath) in
                    cell.textLabel?.text = item
                }
                selectionMenu.show(style: .alert(title: "Выберите язык", action: nil, height: nil), from: self)
            default:
                break
            }

        
    }
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? SideMenuTableViewCell
        switch indexPath.row {
        case 0:
            cell?.switcher.isHidden = false
            cell?.road.isHidden = true
        default:
            break
        }
        // Configure the cell...
        cell?.backgroundColor = .white
        cell?.menu.text = menu[indexPath.row]
        cell?.menu.textColor = .custom_gray()
        return cell ?? UITableViewCell()
    }
 


}
