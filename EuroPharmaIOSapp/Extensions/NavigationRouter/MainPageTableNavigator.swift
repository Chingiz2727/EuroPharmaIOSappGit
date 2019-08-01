//
//  MainPageTableNavigator.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/1/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit

class MainPageTableNavigator:Coordinator {
    func start() {
        
    }
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
   
    
    func list(item:[CategoryContentModel]) {
        let list = ProducstListViewController()
        list.item = item
        list.navigator = self
        navigationController.pushViewController(list, animated: true)
    }
    
    func detail(module:DetailViewModelType) {
        let detail = MedicineDetailViewController()
        detail.viewModule = module
        navigationController.pushViewController(detail, animated: true)
    }
    
    
}
