//
//  NavigatorFromProfile.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/21/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
class NavigatorFromProfile: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    var tab : UserTabBar?
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func returnTab() {
        guard let tab = tab else {return}
        tab.Tab {
            tab.Tab {
                print("here")
                tab.selectProf()
            }
        }
    }
    
    
    func navigate(id:Int) {
        switch id {
        case 0:
            break
        case 1:
            navigationController.pushViewController(DepartmentAdressTableViewController(), animated: true)
        case 2:
            break
        case 4:
            let forget_pass = ForgetPassController()
            navigationController.pushViewController(forget_pass, animated: true)
        default:
            break
        }
    }
   
    
}
