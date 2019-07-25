//
//  BasketViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
class BasketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,RemoveAtCell {
    func removeAtItem(item: Int) {
        let realm = try! Realm()
        
        let result = realm.objects(BasketModule.self)
        try! realm.write {
            realm.delete(result[item])
            self.table.reloadData()
        }
    }
    
    let cellid = "cellid"
    let head = "head"
    let results = try! Realm().objects(BasketModule.self)

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? BasketTableViewCell
        cell?.remove.tag = indexPath.row
        cell?.remove_item = self
        cell?.item = results[indexPath.row]
        // Configure the cell...
        return cell ?? UITableViewCell()
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headd = tableView.dequeueReusableCell(withIdentifier: head) as? BasketTableViewHeader
        
        return headd ?? UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.table.reloadData()
    }
  
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    let table = UITableView()
    let orderview = MakeOrderButtonView()
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.register(BasketTableViewCell.self, forCellReuseIdentifier: cellid)
        table.register(BasketTableViewHeader.self, forCellReuseIdentifier: head)
    }
    override func loadView() {
        super.loadView()
        self.view.addSubview(orderview)
        orderview.snp.makeConstraints { (cons) in
            cons.left.right.bottom.equalTo(self.view).inset(0)
            cons.height.equalTo(70)
        }
        self.view.addSubview(table)
        table.snp.makeConstraints { (cons) in
            cons.left.right.top.equalTo(self.view).inset(0)
            cons.bottom.equalTo(orderview.snp.top).offset(0)
        }
    }

    

}
