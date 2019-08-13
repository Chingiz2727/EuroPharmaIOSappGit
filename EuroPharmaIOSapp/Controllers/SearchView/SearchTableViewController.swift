//
//  SearchTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SKActivityIndicatorView
class SearchTableViewController: UITableViewController {
    let cellid = "cellid"
    let searcher = UITextField()
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
        self.tableView.tableFooterView = UIView()
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
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Module.numofRows()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.tableView.addSubview(searcher)
        searcher.backgroundColor = .custom_green()
        searcher.placeholder = "Введите название"
        searcher.textAlignment = .center
        return searcher
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
  
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? CategoryTableViewCell
        guard let tablecell = cell ,let module = ProductViewModel else {return UITableViewCell()}
        tablecell.selectionStyle = .none
        tablecell.ViewModule = module.cellViewModuleForIndexPath(indexpath: indexPath)
        
        return tablecell
    }
 

  
}
