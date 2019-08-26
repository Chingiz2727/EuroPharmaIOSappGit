//
//  MedicineDetailSource.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/6/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit

extension MedicineDetailTableViewController  {
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return (sections[section-1].collapsed) ? 0 : sections[section-1].items.count
    }
    
 override   func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
  
    
   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        else {
            let head = tableView.dequeueReusableCell(withIdentifier: MainPageIdentifiers().searchHeader) as! MedicineDetailHeaderTableViewCell
            head.name.text = sections[section-1].content
            head.title.tag = section-1
            head.title.addTarget(self, action: #selector(toggleCollapse(sender:)), for: .touchUpInside)
            return head
        }
    }
    @objc func toggleCollapse(sender: UIButton) {
        let section = sender.tag
        let collapsed = sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = !collapsed
        
 
        self.tableView.reloadData()
    }
  override  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else {
            return 60
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MainPageIdentifiers().reuseIdentifier, for: indexPath) as? MedicineTableViewCell
            
            guard let tableCell = cell else { return UITableViewCell()}
            tableCell.product = self.product
            return tableCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MainPageIdentifiers().newitemReuseId, for: indexPath)
    
        cell.backgroundColor = .white()
        cell.textLabel?.textColor = .custom_gray()
        cell.textLabel?.text = sections[indexPath.section-1].items[indexPath.row]
        cell.selectionStyle = .none
        return cell
        
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let back = UIView()
        self.view.addSubview(back)
        back.backgroundColor = .white()
        return back
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    
}
