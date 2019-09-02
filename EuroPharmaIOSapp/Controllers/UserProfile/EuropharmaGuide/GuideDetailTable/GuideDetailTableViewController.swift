//
//  GuideDetailTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class GuideDetailTableViewController: UITableViewController {
    let cellid = "cellid"
    var id : Int?
    var mod = [EuroGuideModule]()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(GuideDetailTableViewCell.self, forCellReuseIdentifier: cellid)
        tableView.separatorStyle = .none
        getData()
      
    }
    func getData() {
        switch id! {
        case 0:
            self.mod = module_ofGuide().deliver_module
        case 1:
            self.mod = module_ofGuide().payment_module
        case 3:
            self.mod = module_ofGuide().return_module
        default:
            break
        }
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mod.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! GuideDetailTableViewCell
        cell.guide = mod[indexPath.row]
        // Configure the cell...

        return cell
    }
 

   

}
