//
//  ProfileTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
import SKActivityIndicatorView

class ProfileTableViewController: UITableViewController, NavigateFromSwipeVC {
    
    var rootSwipeController: SwipeProfileViewController? = nil {
        didSet {
            swipeProfileVC = rootSwipeController
        }
    }
    private var swipeProfileVC: SwipeProfileViewController?
    let cellid = "cellid"
    var reload : RemoveAtCell?
    let headerid = "headerid"
    let menu = ["Europharma гид","Адреса аптек","Город"]
    var network: NetworkManager!
    var logins : Logining?
    
    func navigateToUserProfilePage(item: Int) {
        rootSwipeController?.goFromProfile(item: item)
    }
    
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.network = networkManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.register(SideMenuTableViewCell.self, forCellReuseIdentifier: cellid)
        tableView.register(ProfileLoginTableViewCell.self, forCellReuseIdentifier: headerid)
        tableView.tableFooterView = UIView()
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //swipeProfileVC!.goFromProfile(item: indexPath.row)
        navigateToUserProfilePage(item: indexPath.row)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menu.count
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let head = tableView.dequeueReusableCell(withIdentifier: headerid) as! ProfileLoginTableViewCell
        head.network = self.network
        head.login_button.addTarget(self, action: #selector(push), for: .touchUpInside)
        head.login_button.isUserInteractionEnabled = true
        logins = head
        head.forget.isUserInteractionEnabled = true
        let gest = UITapGestureRecognizer.init(target: self, action: #selector(forget))
        head.forget.addGestureRecognizer(gest)
        head.loginaction = succes
        head.error_action = error
        return head.contentView
    }
    
    
    @objc func push() {
        SKActivityIndicator.show("Загрузка")
        SKActivityIndicator.spinnerStyle(.spinningFadeCircle)
        logins?.login()
        //        self.reload?.removeAtItem(item: 3)
    }
    @objc  func forget() {
        self.reload?.removeAtItem(item: 4)
        
    }
    var window: UIWindow?
    
    func succes() {
        SKActivityIndicator.dismiss()
        
        DispatchQueue.main.async {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.makeKeyAndVisible()
            let tab = UserTabBar()
            tab.Tab {
                tab.Tab {
                    tab.selectProf()
                    
                }
                
            }
            self.window?.rootViewController = UINavigationController(rootViewController: tab)
            
        }
        
    }
    
    func error(error:String) {
        SKActivityIndicator.dismiss()
        CustomAlert.customAlert.showalert(controller: self, text: "Ошибка", message: "Не правильный логин или пароль")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? SideMenuTableViewCell
        cell?.menu.textColor = .custom_gray()
        cell?.imageView?.image = nil
        cell?.menu.text = menu[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
    
}

protocol Logining {
    func login()
}
