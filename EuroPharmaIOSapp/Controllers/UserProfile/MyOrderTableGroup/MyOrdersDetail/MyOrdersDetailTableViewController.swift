//
//  MyOrdersDetailTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit



enum My_OrdersDetail: Int {
    case head
    case orders
    case cost
}

class MyOrdersDetailTableViewController: UITableViewController {
    let headId = "headid"
    let orderId = "orderid"
    let costid = "costid"
    let item = [MyOrdItem(name: "Оплата", title: ""),MyOrdItem(name: "Товаров в заказе", title: "2"),MyOrdItem(name: "Товаров на сумма", title: "9232"),MyOrdItem(name: "Скидка Europharma", title: "900"),MyOrdItem(name: "Доставка", title: "0"),MyOrdItem(name: "Итого", title: "10132")]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MyOrdersDetailBottomTableViewCell.self, forCellReuseIdentifier: costid)
        tableView.register(MyOrdersOrdersTableViewCell.self, forCellReuseIdentifier: orderId)
        tableView.register(MyOrdersHeadTableViewCell.self, forCellReuseIdentifier: headId)
       
    }
    
   
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Товары в заказе"
        }
        return ""
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return My_OrdersDetail.cost.rawValue + 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let section = My_OrdersDetail(rawValue: section) else {return 0}
        switch section {
        case .head:
            return 1
        case .orders:
            return 3
        case .cost:
            return item.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let section = My_OrdersDetail(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch section {
        case .head:
            let cell_heed = tableView.dequeueReusableCell(withIdentifier: headId) as! MyOrdersHeadTableViewCell
            return cell_heed
        case .orders:
            let cell = tableView.dequeueReusableCell(withIdentifier: orderId) as! MyOrdersOrdersTableViewCell
            return cell
        case .cost:
            let cell = tableView.dequeueReusableCell(withIdentifier: costid) as! MyOrdersDetailBottomTableViewCell
            cell.name.text = item[indexPath.row].name ?? ""
            cell.count.text = item[indexPath.row].title ?? ""
            let it = item[indexPath.row]
            if it.name == "Итого" || it.name == "Оплата" {
                cell.name.get_bold(size: 20)
                cell.count.get_bold(size: 20)
            }
            tableView.separatorStyle = .none
            return cell
        }
    }
    

   

}
