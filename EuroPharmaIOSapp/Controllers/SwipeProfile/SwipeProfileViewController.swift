//
//  SwipeProfileViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/9/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SwipeMenuViewController
import SKActivityIndicatorView
class SwipeProfileViewController: SwipeMenuViewController,RemoveAtCell {
    func removeAtItem(item: Int) {
        DispatchQueue.main.async {
            if item == 3 {
                guard let tab = self.tabBarController as? UserTabBar else {return}
                tab.Tab {
                    print("changedItem")
                        tab.selectProf()
                }
            }
            else {
                self.navigator?.navigate(id: item)
                
            }
        }
     
        
    }
    
    var navigator : NavigatorFromProfile?
    let profile = ProfileTableViewController(networkManager: NetworkManager())
    let user = RegistrationViewController()
    
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
        profile.reload = self
        self.view.backgroundColor = .white
        options.tabView.style = .segmented
        swipeMenuView.reloadData(options: options)
        navigator = NavigatorFromProfile(navigationController: self.navigationController!)
    }
    
   
 
    


}



