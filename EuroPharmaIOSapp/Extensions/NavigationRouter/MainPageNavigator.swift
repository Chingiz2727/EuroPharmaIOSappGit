//
//  MainNavigator.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/30/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
class MainPageNavigator:Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(UserTabBar(), animated: true)
    }
    
    
   
}
