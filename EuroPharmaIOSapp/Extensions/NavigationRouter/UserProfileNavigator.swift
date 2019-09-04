//
//  UserProfilePageNavigator.swift
//  EuroPharmaIOSapp
//
//  Created by Александр on 9/3/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class UserProfilePageNavigator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func userInformation(item: Int) {
        assert(item >= 0 || item < 2)
        switch item {
        case 0:
            //navigationController.pushViewController(EuroPharmaGuideViewController(), animated: true)
            navigationController.pushViewController(MainPageGuideTableViewController(), animated: true)
        case 1:
            navigationController.pushViewController(DepartmentAdressTableViewController(), animated: true)
        default:
            print("choosed \(item) case")
        }
    }
    
    func start() {
        
    }
    
}
