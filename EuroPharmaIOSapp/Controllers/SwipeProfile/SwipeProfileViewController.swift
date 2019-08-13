//
//  SwipeProfileViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/9/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SwipeMenuViewController
class SwipeProfileViewController: SwipeMenuViewController {
    let profile = ProfileTableViewController()
    let user = RegistrationViewController()

    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        let controllers = [profile,user]
        profile.pushing = push
        return controllers[index]
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        
        return items[index]
    }
    var items = ["Войти","Создать аккаунт"]
    var options = SwipeMenuViewOptions()

    override func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return 2
    }
    
    func push() {
        self.navigationController?.pushViewController(BasketViewController(), animated: true)
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        options.tabView.style = .segmented
        swipeMenuView.reloadData(options: options)
    }
    
   
 
    


}

