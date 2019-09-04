//
//  SwipeProfileViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/9/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SKActivityIndicatorView
import SwipeMenuViewController
class SwipeProfileViewController: SwipeMenuViewController,RemoveAtCell {
    let vc = SwipeMenuViewController()
    func removeAtItem(item: Int) {
        DispatchQueue.main.async {
            if item == 3 {
                guard let tab = self.tabBarController as? UserTabBar else {return}
                tab.Tab {
                        tab.selectProf()
                }
            }
            else {
                self.navigator?.navigate(id: item)
                
            }
        }
     
        
    }
    let profile : UIViewController = {
        let prof = ProfileTableViewController(networkManager: NetworkManager())
        let nav = UINavigationController.init(rootViewController: prof)
        return nav
    }()
    
    var navigator : NavigatorFromProfile?
    let user : UIViewController = {
        let prof = RegistrationViewController()
        let nav = UINavigationController.init(rootViewController: prof)
        
        return nav
        
    }()
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        let controllers = [profile,user]
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
   
   

    override func viewDidLoad() {
        super.viewDidLoad()
        options.tabView.itemView.clipsToBounds = true
        self.view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .custom_gray()
        navigator = NavigatorFromProfile(navigationController: self.navigationController!)
        options.tabView.style = .segmented
        swipeMenuView.reloadData(options: options)
        
    }
    
   
 
    


}



