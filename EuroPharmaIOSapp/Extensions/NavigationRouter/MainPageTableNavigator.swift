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
    
    func detail(module:Int,title:String) {
        let manager = NetworkManager()
        let detail = MedicineDetailViewController(networkManager: manager)
        detail.id = module
        detail.title_name = title
        detail.navigator = self
        navigationController.pushViewController(detail, animated: true)
    }
    
  @objc func main_page() {
    let manager = NetworkManager()

        navigationController.popToViewController(MainPageTable(networkManager: manager), animated: true)
    }
    
    func detailFromFavAndBasket(id:Int) {
        let manager = NetworkManager()
        let detail = MedicineDetailViewController(networkManager: manager)
        detail.id = id
        detail.navigator = self
        navigationController.pushViewController(detail, animated: true)
    }
}
