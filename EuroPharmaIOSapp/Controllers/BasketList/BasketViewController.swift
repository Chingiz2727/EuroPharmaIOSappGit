//
//  BasketViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
class BasketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,RemoveAtCell,BuyProductActions {
    func remove() {
        
    }
    
    var count: Int = 0
    
    
    var results = try! Realm().objects(BasketModule.self)
    
    
    

    func removeAtItem(item: Int) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(results[item])
            self.table.reloadData()
 
        }
    }
    let emptyView = EmptyView()

    func check(count:Int) {

        if count == 0 {
            self.view.addSubview(emptyView)
            emptyView.addview()
            emptyView.icon.image = #imageLiteral(resourceName: "корзина")
            emptyView.title.text = "В корзине нет товаров"
            emptyView.descript.text = "Перейдите в каталог, чтобы выбрать и заказать нужный товар"
            emptyView.snp.makeConstraints { (cons) in
                cons.edges.equalToSuperview()
            }
        }
        else {
           emptyView.remove()
            
        }
    }
    
    var token: NotificationToken? = nil

    func notify() {
        
        token = results.observe(  { [weak self] (changes:RealmCollectionChange) in
            self?.check(count: self?.results.count ?? 0)
            switch changes {
            
            case.update(_, deletions: _, insertions:  _, modifications:  _):
                
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
            return 350
        }
//        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? BasketTableViewCell
            cell?.remove_item = self
            let item = results[indexPath.row]
            cell?.item = results[indexPath.row]
        
            cell?.buy.write = WriteProduct(id: item.id, price: item.cost, name: item.name, img: item.img_url ?? "", manufacturer: item.manufacturer ?? "")
            cell?.buy.count = item.count
            cell?.buy.write?.Basket = item
            cell?.buy.write?.tag = indexPath.row

            cell?.buy.write?.remoatcell = self
            cell?.buy.tag = indexPath.row
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
            headd.backgroundColor = .white
            return headd
        default:
            return UIView()
        }
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.view.updateConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.table.reloadData()
        check(count: table.numberOfRows(inSection: 0))
        

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
        table.backgroundColor = .white()
        self.view.backgroundColor = .white()
    }
    override func loadView() {
        super.loadView()
      
        self.view.addSubview(table)
        table.snp.makeConstraints { (cons) in
            cons.left.right.bottom.top.equalTo(self.view).inset(0)
        }
    }

    

}
