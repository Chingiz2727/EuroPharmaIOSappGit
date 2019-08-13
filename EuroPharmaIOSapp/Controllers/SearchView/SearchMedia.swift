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
extension UIViewController:UISearchBarDelegate {
 
    

    func addNavBarImage() {
        let search = UISearchBar()
        search.endEditing(true)
        search.placeholder = "Поиск лекарств и товаров"
        search.delegate = self
        search.heightAnchor.constraint(equalToConstant: 44).isActive = true
        navigationItem.titleView = search
        navigationController?.navigationBar.tintColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(nil, imageName: "logo1")
        navigationController?.navigationBar.isTranslucent = false
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    

        let client = Client(appID: "JAF0WTBM3O", apiKey: "de62593337a71b8e7ca3650cf262f558")
        let index = client.index(withName: "products")
        index.search(Query(query: searchBar.text!)) { (content, error) in
            guard let content = content else {return}
            
            let json = JSON(content)
        }
    }
    
    
    
}
