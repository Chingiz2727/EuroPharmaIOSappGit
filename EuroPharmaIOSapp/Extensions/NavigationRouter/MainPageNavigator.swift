//
//  MainNavigator.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/30/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class MainPageNavigator:Coordinator {
    let item = try! Realm().objects(SavedCity.self)

    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        guard (item.last?.id) != nil else {
            toCCity()
            return }
        toTab()
    }
    
    
    func toCCity() {
        navigationController.pushViewController(ChooseCityViewController(networkManager: NetworkManager()), animated: true)
        
    }
    
    func toTab() {
         navigationController.pushViewController(UserTabBar(), animated: true)
    }
   
}
