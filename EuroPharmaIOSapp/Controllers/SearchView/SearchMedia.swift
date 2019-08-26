//
//  SearchMedia.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/13/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import InstantSearch
import SwiftyJSON

import UIKit
extension MainPageTable:UISearchBarDelegate,DismissAndGo,UISearchControllerDelegate {
    func DissMissAndGo(id: Int, title: String) {
        content.removeFromSuperview()
        addNavBarImage()
        print(title)
        navigator?.detail(module: id, title: title)
    }
    
   

    func addNavBarImage() {
        let sc = UISearchController(searchResultsController: nil)
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        sc.delegate = self
        let scb = sc.searchBar
        sc.searchBar.delegate = self
        sc.definesPresentationContext = true
        definesPresentationContext = true
        scb.tintColor = UIColor.white
        scb.barTintColor = UIColor.white
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "ezgif.com-gif-maker")
        imageView.image = image
        logoContainer.addSubview(imageView)
        scb.placeholder = "Поиск лекарств и товаров"
        navigationItem.titleView = logoContainer
        if let textfield = scb.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.blue
            if let backgroundview = textfield.subviews.first {
                
                // Background color
                backgroundview.backgroundColor = UIColor.white
                
                // Rounded corner
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
                
            }
        }
        
        if let navigationbar = self.navigationController?.navigationBar {
            navigationbar.barTintColor = UIColor.custom_gray()
        }
        navigationItem.searchController = sc
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        content.removeFromSuperview()
        searchBar.endEditing(true)
    }
    
   
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.view.addSubview(content)
        content.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(self.view)
        }

        return true
    }
    
  public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    content.removeFromSuperview()
    }
  
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    update = content
    content.dismissgo = self
    update?.update(text: searchText)
    

    }
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    
    
    
}
protocol DismissAndGo {
    func DissMissAndGo(id:Int,title:String)
}
