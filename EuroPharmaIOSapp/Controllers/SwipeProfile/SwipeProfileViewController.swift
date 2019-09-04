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

protocol NavigateFromSwipeVC {
    var rootSwipeController: SwipeProfileViewController? {get set}
    func navigateToUserProfilePage(item: Int)
}

class SwipeProfileViewController: SwipeMenuViewController, RemoveAtCell {
    
    let vc = SwipeMenuViewController()
    var navigator : UserProfilePageNavigator?
    var items = ["Войти", "Создать аккаунт"]
    var options = SwipeMenuViewOptions()
    
    let profile : UIViewController = {
        
        let prof = ProfileTableViewController(networkManager: NetworkManager())
        let nav = UINavigationController.init(rootViewController: prof)
        return nav
        
    }()
    
    let user : UIViewController = {
        
        let prof = RegistrationViewController()
        let nav = UINavigationController.init(rootViewController: prof)
        return nav
        
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        options.tabView.itemView.clipsToBounds = true
        self.view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .custom_gray()
        navigator = UserProfilePageNavigator(navigationController: self.navigationController!)
        options.tabView.style = .segmented
        swipeMenuView.reloadData(options: options)
        navigationItem.title = "Профиль"

    }
    
    func goFromProfile(item: Int) {
        self.navigator?.userInformation(item: item)
    }
    
    func removeAtItem(item: Int) {
        DispatchQueue.main.async {
            if item == 3 {
                guard let tab = self.tabBarController as? UserTabBar else {return}
                tab.Tab {
                    tab.selectProf()
                }
            }
            else {
                self.navigator?.userInformation(item: item)
            }
        }
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        let controllers = [profile, user]
        let currentVC = controllers[index]
        guard let currentNavController = currentVC as? UINavigationController else { return currentVC }
        for subVC in currentNavController.viewControllers {
            guard var subViewController = subVC as? NavigateFromSwipeVC else { continue }
            subViewController.rootSwipeController = self
        }
        return currentVC
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return items[index]
    }
    
    override func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return 2
    }
    
}



