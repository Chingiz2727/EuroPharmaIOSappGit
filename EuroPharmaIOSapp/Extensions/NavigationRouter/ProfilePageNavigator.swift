//
//  ProfilePageNavigator.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/1/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class ProfilePageNavigator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func go_toLogin(relod:reloadData) {
        let login = LoginViewController()
        
        login.reload = relod
        self.navigationController.pushViewController(login, animated: true)
    }
    
    
    func userSettings(indexpath:IndexPath) {
        switch indexpath.section {
        case 0:
            switch indexpath.row {
            case 0:
                navigationController.pushViewController(MyDataTableViewController(), animated: true)
            case 1:
                navigationController.pushViewController(MyOrdersTableView(), animated: true)
            case 2:
                navigationController.pushViewController(OrderStatusViewController(), animated: true)
            case 3:
                navigationController.pushViewController(AdressTableViewController(), animated: true)
            default:
                break
            }
        case 1 :
            switch indexpath.row {
            case 0:
                navigationController.pushViewController(UserSettingTableViewController(), animated: true)
            case 1:
                let realm = try! Realm()
                try! realm.write {
                    
                    guard let tab = navigationController.tabBarController as? UserTabBar else {return}
                        tab.Tab {
                            let user = try! Realm().objects(UserData.self)
                            
                            realm.delete(user)
                            tab.Tab {
                                tab.selectProf()

                            }

                        }
                     
                    
                    

                }
            default:
                break
            }
            
        case 2:
            switch indexpath.row {
            case 0:
                navigationController.pushViewController(MainPageGuideTableViewController(), animated: true)
            case 1:
                navigationController.pushViewController(DepartmentAdressTableViewController(), animated: true)
            default:
                break
            }
        default:
            break
        }
    }
    
    
}
