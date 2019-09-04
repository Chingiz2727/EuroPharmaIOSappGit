//
//  SearchViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 9/4/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UISearchBarDelegate,UISearchControllerDelegate,DismissAndGo {

    var content = SearchContentView()
    var update : updateSearchTable?
    var navigator : MainPageTableNavigator?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addNavBarImage()
    }
    
    func DissMissAndGo(id: Int, title: String) {
        content.removeFromSuperview()
        addNavBarImage()
        navigator?.detail(module: id, title: title)
    }
    
    
    
    func addNavBarImage() {
        let sc = UISearchController(searchResultsController: nil)
        sc.delegate = self
        let scb = sc.searchBar
        sc.searchBar.delegate = self
        sc.definesPresentationContext = true
        definesPresentationContext = true
        scb.tintColor = UIColor.white
        scb.barTintColor = UIColor.white
        
        scb.placeholder = "Поиск по каталогу"
        navigationItem.title = "Каталог"
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
            navigationbar.barTintColor = .custom_gray()
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
