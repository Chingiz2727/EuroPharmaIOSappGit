//
//  ExpandedTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class ExpandedTableViewController: UITableViewController {
    var id : Int?
    var module = [ExpandedModule]()
    let cellid = "cellid"
    var changeitems : ChangeItems?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        tableView.register(MedicineDetailHeaderTableViewCell.self, forCellReuseIdentifier: MainPageIdentifiers().searchHeader)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:  MainPageIdentifiers().newitemReuseId)
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        setupdData()
    }
    
    func setupdData() {
        switch id! {
        case 2:
            self.module = module_ofGuide().make_order_tutorial
        default:
            self.module = module_ofGuide().tutorial
        }
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        
        return (module[section].collapsed) ? 0 : module[section].text!.count
    }
    
    override   func numberOfSections(in tableView: UITableView) -> Int {
        return module.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
            let head = tableView.dequeueReusableCell(withIdentifier: MainPageIdentifiers().searchHeader) as! MedicineDetailHeaderTableViewCell
            head.name.text = module[section].title
            head.layoutIfNeeded()
            changeitems = head
            head.title.tag = section
            head.title.addTarget(self, action: #selector(toggleCollapse(sender:)), for: .touchUpInside)
            return head
        
    }
    
    @objc func toggleCollapse(sender: UIButton) {
        changeitems?.change()
        let section = sender.tag
        let collapsed = module[section].collapsed
        
        module[section].collapsed = !collapsed
        
        
        self.tableView.reloadData()
    }
    
  
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainPageIdentifiers().newitemReuseId, for: indexPath)
        
        cell.backgroundColor = .white()
        cell.textLabel?.textColor = .custom_gray()
        cell.textLabel?.text = module[indexPath.section].text![indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.layoutIfNeeded()
        cell.selectionStyle = .none
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let back = UIView()
        self.view.addSubview(back)
        back.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        return back
    }
    
   
    
}
