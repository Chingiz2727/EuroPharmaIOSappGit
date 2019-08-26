//
//  SearchTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SKActivityIndicatorView
class SearchTableViewController: UITableViewController,UISearchBarDelegate,DismissAndGo,UISearchControllerDelegate {
    let cellid = "cellid"
    let searcher = UITextField()
    var content = SearchContentView()
    var update : updateSearchTable?
    var ProductViewModel:CategoryModuleType?
    var Module = CategoryViewModule()
    var netwoking : NetworkManager!
    init(networkin:NetworkManager) {
        self.netwoking = networkin
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.bounces = true
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: cellid)
        ProductViewModel = Module
        loadData()
        navigationController?.navigationBar.barTintColor = .custom_gray()
        navigationController?.title = "Каталог"
        self.view.backgroundColor = .white()
        self.tableView.backgroundColor = .white()
        self.tableView.tableFooterView = UIView()
        addNavBarImage()
    }
    
    func loadData() {
        netwoking.getShopList { (prod, error) in
            SKActivityIndicator.show()
            guard let ord = prod , let item = ord.categories else {return}
            self.Module.category = item
            DispatchQueue.main.async {
                self.tableView.reloadData()
                SKActivityIndicator.dismiss()
            }
        }
    }
    
   

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Module.numofRows()
    }
    
   
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
  
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? CategoryTableViewCell
        guard let tablecell = cell ,let module = ProductViewModel else {return UITableViewCell()}
        tablecell.selectionStyle = .none
        tablecell.ViewModule = module.cellViewModuleForIndexPath(indexpath: indexPath)
        
        return tablecell
    }
 
    func DissMissAndGo(id: Int, title: String) {
        content.removeFromSuperview()
        addNavBarImage()
        print(title)
//        navigator?.detail(module: id, title: title)
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
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    
    
    
  
}
