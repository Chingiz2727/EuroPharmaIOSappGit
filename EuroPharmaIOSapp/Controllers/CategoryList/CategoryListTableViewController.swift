//
//  CategoryListTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/17/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class CategoryListTableViewController: UITableViewController {
    var id : String = ""
    var cat = [Category]()
    let cellid = "cellid"
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
        cell.textLabel?.text = cat[indexPath.row].name ?? ""
        cell.backgroundColor = .white()
        cell.selectionStyle = .none
        cell.textLabel?.textColor = .custom_gray()
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cat.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
   
    
    
   
    
    func getData() {
        Networking.Request(view:self,type: Product.self, params: nil, header: nil, url: Endpoint.main_url.rawValue + Endpoint.categories.rawValue + id, method: .get) { [weak self] (data, success, error) in
            if success == true {
                if let info = data?.categories {
                    self?.cat = info
                    self?.tableView.reloadData()
                }
            }
        }
      
    }
    
  
}
