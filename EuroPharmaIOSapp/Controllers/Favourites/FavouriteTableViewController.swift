//
//  FavouriteTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/25/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
class FavouriteTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let cellid = "cellid"
    let results = try! Realm().objects(FavouritesModule.self)
    let emptyView = EmptyView()
    let table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(table)
        table.snp.makeConstraints { (cons) in
            cons.edges.equalToSuperview()
        }
        table.dataSource = self
        table.delegate = self
        table.register(FavouriteTableViewCell.self, forCellReuseIdentifier: cellid)
        navigator = MainPageTableNavigator(navigationController: self.navigationController!)
        navigationController?.navigationBar.barTintColor = .custom_gray()
        notify()

    }
    var token: NotificationToken? = nil
    
    func notify() {
        
        token = results.observe(  { [weak self] (changes:RealmCollectionChange) in
            self?.check(count: self?.results.count ?? 0)
            switch changes {
                
            case.update(_, deletions: _, insertions:  _, modifications:  _):
                
                print("objecssd")
                self?.table.reloadData()
            case .initial(_):
                print("init")
                
            case .error(let error):
                print(error)
            }
        })
    }
    
    var navigator : MainPageTableNavigator?

    func check(count:Int) {
        
        if count == 0 {
//            self.view.addSubview(emptyView)
            self.view.addSubview(emptyView)
            emptyView.addview()
            emptyView.icon.image = #imageLiteral(resourceName: "heart")
            emptyView.title.text = "В избранном нет товаров"
            emptyView.descript.text = "Перейдите в каталог, чтобы начать добавлять товары в Избранное"
            emptyView.snp.makeConstraints { (cons) in
                cons.edges.equalToSuperview()
            }
        }
        else {
            emptyView.remove()
            
        }
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.table.reloadData()
        check(count: table.numberOfRows(inSection: 0))
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return results.count
    }
    let manager = NetworkManager()
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     navigator?.detailFromFavAndBasket(id: results[indexPath.row].id)
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? FavouriteTableViewCell
//        cell?.module = results[indexPath.row]
        let item = results[indexPath.row]
        cell?.item = item
        cell?.buy.id = item.id
        cell?.fav.check(id: item.id)
        
        cell?.buy.write = WriteProduct(id: item.id, price: item.cost, name: item.name!, img: item.img_url!,manufacturer: "")
        cell?.fav.viewModule = FavModule(id: item.id, img: item.img_url!, cost: item.cost, name: item.name!,manufacturer: item.manufacturer ?? "")
        return cell ?? UITableViewCell()
    }
    

  
}
