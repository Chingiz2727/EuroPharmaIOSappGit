//
//  TabBar.swift
//  LombardApp
//
//  Created by Shyngys Kuandyk on 7/5/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
class UserTabBar: UITabBarController,UITabBarControllerDelegate {
    var token: NotificationToken? = nil

    var count : Int = 0 {
        didSet {
            if let tabItems = self.tabBar.items {
                let tabitem = tabItems[2]
                
                tabitem.badgeValue = "\(count)"
                tabitem.badgeColor = .red
            }
        }
    }
    let item = BasketModule()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        self.navigationController?.navigationBar.isTranslucent = false
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: -5, width: 270, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = #imageLiteral(resourceName: "ezgif.com-gif-maker")
        imageView.image = image
        logoContainer.addSubview(imageView)
        UINavigationController().navigationItem.titleView = logoContainer
         UINavigationController().navigationBar.barTintColor = .custom_gray()
        UINavigationController().navigationBar.isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.custom_gray()
        UITabBar.appearance().itemPositioning = .fill
          Tab()
     notify()
    }
    
    func notify() {
        let results = try! Realm().objects(BasketModule.self)
        self.count = results.count
        
        token = results.observe(  { [weak self] (changes:RealmCollectionChange) in
            switch changes {
            case.update(_, deletions: let _, insertions: let insert, modifications: let notify):
               self?.count = results.count
            case .initial(_):
                print("init")
            case .error(let error):
                print(error)
            }
        })
    }
    
    func Tab() {
        self.navigationController?.navigationBar.isTranslucent = false
        let firstVc = UINavigationController(rootViewController: MainPageTable())
        firstVc.tabBarItem = UITabBarItem(title: "Главная", image: nil, selectedImage: nil)
        let secondVc = UINavigationController(rootViewController: SearchTableViewController())
        secondVc.tabBarItem = UITabBarItem(title: "Поиск", image: nil, selectedImage: nil)
        let thirdVC = UINavigationController(rootViewController: BasketViewController())
        thirdVC.tabBarItem = UITabBarItem(title: "Корзина", image: nil, selectedImage: nil)
        let fourthVC = UINavigationController(rootViewController: FavouriteTableViewController())
        fourthVC.tabBarItem = UITabBarItem(title: "Избранное", image: nil, selectedImage: nil)
        let fifthVC = UINavigationController(rootViewController: SideMenuTableViewController())
        fifthVC.tabBarItem = UITabBarItem(title: "Профиль", image: nil, selectedImage: nil)
        
        let tabbarlist = [firstVc,secondVc,thirdVC,fourthVC,fifthVC]
        viewControllers = tabbarlist
        self.tabBar.isTranslucent = false
    
    }
    
}
