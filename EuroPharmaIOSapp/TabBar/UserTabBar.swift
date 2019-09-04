//
//  TabBar.swift
//  LombardApp
//
//  Created by Shyngys Kuandyk on 7/5/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
import InstantSearchClient
import SwiftyJSON

class UserTabBar: UITabBarController,UITabBarControllerDelegate {
    var user = try! Realm().objects(UserData.self)

    func navigate(to destination: UserTabBar.Destination) {
        
    }
    
    
    
    enum Destination {
        case main
        case catalog
        case basket
        case favourite
        case menu
    }
    
    var token: NotificationToken? = nil

    var count : Int = 0 {
        didSet {
            if let tabItems = self.tabBar.items {
                let tabitem = tabItems[2]
                
                tabitem.badgeValue = "\(count)"
                
                tabitem.badgeColor = .custom_green2()
            }
        }
    }
    
    let item = BasketModule()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    lazy var networkManager = NetworkManager()

    
    lazy var firstVC : UIViewController = {
       var vc = MainPageTable(networkManager: networkManager)
        
        vc.tabBarItem = UITabBarItem(title: "Главная", image: #imageLiteral(resourceName: "Vector"), selectedImage: nil)
        let nvController = UINavigationController(rootViewController: vc)
        return nvController
    }()
    
    lazy var secondVC : UIViewController = {
        var vc = SearchTableViewController(networkin: networkManager)
        vc.tabBarItem = UITabBarItem(title: "Каталог", image: #imageLiteral(resourceName: "Group-2"), selectedImage: nil)
        let nvController = UINavigationController(rootViewController: vc)
        return nvController
    }()
    
    lazy var thirdVC : UIViewController = {
        var vc = BasketViewController()
        vc.tabBarItem = UITabBarItem(title: "Корзина", image: #imageLiteral(resourceName: "Group"), selectedImage: nil)
        let nvController = UINavigationController(rootViewController: vc)
        return nvController
    }()
    
    lazy var fourthVC : UIViewController = {
        var vc = FavouriteTableViewController()
        vc.tabBarItem = UITabBarItem(title: "Избранное", image: #imageLiteral(resourceName: "Vector-2"), selectedImage: nil)
        let nvController = UINavigationController(rootViewController: vc)
        return nvController
    }()
    
    lazy var SwipeVc : UIViewController = {
       var vc = SwipeProfileViewController()
        vc.tabBarItem = UITabBarItem(title: "Профиль", image: #imageLiteral(resourceName: "Vector-3"), selectedImage: nil)

        let nvController = UINavigationController(rootViewController: vc)
        return nvController
    }()
    lazy var Profile : UIViewController = {
        var vc = UserProfileTableViewController()
        vc.tabBarItem = UITabBarItem(title: "Профиль", image: #imageLiteral(resourceName: "Vector-3"), selectedImage: nil)
        
        let nvController = UINavigationController(rootViewController: vc)
        return nvController
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Tab {
            
        }
        
        tabBar.tintColor = .black
        tabBar.selectedItem?.badgeColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: -5, width: 270, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = #imageLiteral(resourceName: "ezgif.com-gif-maker")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationController?.navigationItem.titleView = logoContainer
        UINavigationController().navigationBar.isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.custom_white()
        UITabBar.appearance().itemPositioning = .fill
//        self.tabBar.isTranslucent = true
        self.tabBar.frame.size.height = 70
        self.selectedViewController?.tabBarController?.tabBarItem.badgeColor = .black
      
     notify()
        self.tabBar.isTranslucent = false
        tabBar.backgroundColor = .white

        tabBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
    
    
    func notify() {
        let results = try! Realm().objects(BasketModule.self)
        self.count = results.count
        
        token = results.observe(  { [weak self] (changes:RealmCollectionChange) in
            switch changes {
            case.update(_, deletions: _, insertions: let _, modifications: let _):
               self?.count = results.count
            case .initial(_):
                print("init")
            case .error(let error):
                print(error)
            }
        })
        

    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        tabBar.tintColor = .black
    }
 
    func selectProf() {
        self.tabBarController?.selectedIndex = 4
        self.selectedIndex = 4
    }
    
    func Tab(completion:@escaping()->()) {
     
        var tabbarlist = [firstVC,secondVC,thirdVC,fourthVC]
        if (user.first?.token) != nil {
            tabbarlist.append(Profile)
            setViewControllers(tabbarlist, animated: true)
            completion()
        }
        else {
            tabbarlist.append(SwipeVc)
            setViewControllers(tabbarlist, animated: true)
            completion()
        }
    
    }
    
}




extension UIBarButtonItem {
    
    static func menuButton(_ target: Any?, imageName: String) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        return menuBarItem
    }
}
