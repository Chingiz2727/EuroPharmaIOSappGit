//
//  ProfilePageNavigator.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/1/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
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
    
    
}
