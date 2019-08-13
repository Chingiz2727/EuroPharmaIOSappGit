//
//  SideMenuTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/15/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SideMenu
protocol reloadData {
    func reload()
}
class SideMenuTableViewController: UITableViewController,reloadData {
    func reload() {
        self.tableView.reloadData()
    }
    
    var coordinator : ProfilePageNavigator?
    
let cellid = "cellid"
    let items = [[],["Europharma гид"],["Алматы","Русский"]]
    let headid = "headid"
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.register(SideMenuTableViewCell.self, forCellReuseIdentifier: cellid)
        tableView.register(ProfileLoginTableViewCell.self, forCellReuseIdentifier: headid)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.custom_white()
        navigationController?.view.backgroundColor = UIColor.custom_white()
        navigationController?.navigationBar.barTintColor = UIColor.custom_gray()
        tableView.bounces = false
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: -5, width: 270, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = #imageLiteral(resourceName: "euro_pharm_white")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            
            let head_profile = tableView.dequeueReusableCell(withIdentifier: headid) as! ProfileLoginTableViewCell
//            head_profile.profile = go_profile
//            head_profile.login_button.addTarget(self, action: #selector(goContent(sender:)), for: .touchUpInside)
//            head_profile.register_button.addTarget(self, action: #selector(goContent(sender:)), for: .touchUpInside)
            return head_profile
        default:
            return tableView.tableHeaderView
        }
    }
    
    @objc func go_profile() {
        let profile = ProfileTableViewController()
        profile.reload = self
        self.navigationController?.pushViewController(profile, animated: true)
    }
    
    @objc func goContent(sender:UIButton) {
         coordinator = ProfilePageNavigator(navigationController: self.navigationController ?? UINavigationController())
        switch sender.tag {
        case 0:
            self.navigationController?.pushViewController(RegistrationViewController(), animated: true)
        default:
           
            coordinator?.go_toLogin(relod: self)
       
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Профиль"
        case 1:
            return "Информация"
        case 2:
            return "Настройки"
        default:
            return ""
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? SideMenuTableViewCell
        cell?.menu.text = items[indexPath.section][indexPath.row]

        return cell ?? UITableViewCell()
    }
 

}


