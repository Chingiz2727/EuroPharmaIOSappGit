//
//  MyDataTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/12/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift

class MyDataTableViewController: UITableViewController,UITextFieldDelegate {
let cellid = "cellid"
    let footid = "footid"
   let headid = "headid"
    var module = MyDataModule()
    let item = ["Личная информация","Контактная информация"]
    var results = try! Realm().objects(UserData.self)
    var city_detail = try! Realm().objects(SavedCity.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MyDataTableViewCell.self, forCellReuseIdentifier: cellid)
        tableView.register(SaveProfileTableViewCell.self, forCellReuseIdentifier: footid)
        tableView.register(MyDataLabelHead.self, forCellReuseIdentifier: headid)
        tableView.separatorStyle = .none
        tableView.tableHeaderView?.backgroundColor = .white()
        tableView.backgroundColor = .white()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let head = tableView.dequeueReusableCell(withIdentifier: headid) as! MyDataLabelHead
        head.label_text.text = item[section]
        return head
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return UserFullInfo.UserEphone.rawValue + 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = UserFullInfo(rawValue: section) else {return 0}
        switch section {
        case .userinfo:
            return UserInfoEdit.city.rawValue + 1
        case .UserEphone:
            return UserInfoEphone.email.rawValue + 1
        }
    }

  
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! MyDataTableViewCell
        cell.textf.delegate = self
        guard  let section = UserFullInfo(rawValue: indexPath.section) else {
            return UITableViewCell() }
        switch section {
        case .userinfo:
            let item = UserInfoEdit(rawValue: indexPath.row)
            
            switch item! {
            case .name:
                cell.textf.placeholder = "Имя"
                cell.textf.text = results.first?.first_name ?? ""
                cell.textf.tag = 0
            case .gender:
                cell.textf.placeholder = "Пол"
                cell.textf.tag = 1

            case .city:
                cell.textf.placeholder = "Город"
                cell.textf.tag = 2
                
                cell.textf.text = city_detail.first?.name ?? ""
            }
            
            
        case .UserEphone:
            let item = UserInfoEphone(rawValue: indexPath.row)
            switch item! {
            case .email:
                cell.textf.placeholder = "E-mail"
                cell.textf.tag = 3

            case .phone:
                cell.textf.placeholder = "Телефон"
                cell.textf.tag = 4
                cell.textf.text = results.first?.phone ?? ""
            }
        }
        
        return cell
    }
    
  
    
    @objc func send_data() {

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
        foot.button.addTarget(self, action: #selector(send_data), for: .touchUpInside)
        if section == 1 {
            return foot
        }
        else {
            return nil
        }
     
    }
    
    
}



enum UserInfoEdit:Int {
    case name
    case gender
    case city
}

enum UserInfoEphone:Int {
    case phone
    case email
}

enum UserFullInfo:Int {
    case userinfo
    case UserEphone
}


