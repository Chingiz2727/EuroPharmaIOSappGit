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
    let results = try! Realm().objects(BasketModule.self)

    func removeAtItem(item: Int) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(results[item])
            self.table.reloadData()
        }
    }
    
    var token: NotificationToken? = nil

    func notify() {
        
        token = results.observe(  { [weak self] (changes:RealmCollectionChange) in
            switch changes {
            case.update(_, deletions: _, insertions:  _, modifications:  _):
                self?.table.reloadData()
                print("objecssd")
            case .initial(_):
                print("init")
            case .error(let error):
                print(error)
            }
        })
    }
    
    let cellid = "cellid"
    let head = "head"
    let likeid = "likeid"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return results.count
        default:
            return 1
        }
    }
    
    var navigator : MainPageTableNavigator?

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 130
        default:
            return 440
        }
//        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? BasketTableViewCell
            cell?.remove_item = self
            cell?.item = results[indexPath.row]
            return cell ?? UITableViewCell()
        default:
            let like = tableView.dequeueReusableCell(withIdentifier: likeid) as! MayBeULikeTableViewCell
            like.collectionView.delegate = self
            like.collectionView.dataSource = self
            return like
        }
     
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigator?.detailFromFavAndBasket(id: results[indexPath.row].id)
    }
    
  
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let headd = tableView.dequeueReusableCell(withIdentifier: head) as! BasketTableViewHeader
            
            return headd
        default:
            return UIView()
        }
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.table.reloadData()
    }
  
    
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    let table = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        notify()
        table.register(BasketTableViewCell.self, forCellReuseIdentifier: cellid)
        table.register(BasketTableViewHeader.self, forCellReuseIdentifier: head)
        table.register(MayBeULikeTableViewCell.self, forCellReuseIdentifier: likeid)
        navigator = MainPageTableNavigator(navigationController: self.navigationController!)
        navigationController?.navigationBar.barTintColor = .custom_gray()

    }
    override func loadView() {
        super.loadView()
      
        self.view.addSubview(table)
        table.snp.makeConstraints { (cons) in
            cons.left.right.bottom.top.equalTo(self.view).inset(0)
        }
    }

    

}
