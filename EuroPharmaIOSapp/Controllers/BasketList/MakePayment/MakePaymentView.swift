//
//  MakePaymentView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 9/3/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MakePaymentView: UIView,UITableViewDataSource,UITableViewDelegate{
    let cellid = "cellid"
    let cellid2 = "cellid2"
    let headid = "headid"
    let items = ["Способ доставки","Способ оплаты"]
    var checkb : ChangeCheckBox?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return PayContent().main_module[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let it = PayMentSection(rawValue: indexPath.section) else {return UITableViewCell()}
        switch it {
        case .delivering:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellid) as! MakePaymentTableViewCell
            let item = PayContent().main_module[0][indexPath.row]
            cell.title.text = item.title
            
            cell.comment.text = item.sub_title
            cell.title_desc.text = item.descript
            return cell
        case .ordering:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: cellid2) as! MakePaymentTableViewCell2
            let item = PayContent().main_module[1][indexPath.row]
            cell2.tag = 1
            cell2.title.text = item.title
            cell2.comment.text = item.sub_title
            cell2.title_desc.text = item.descript
            return cell2
      
        }
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let it = PayMentSection(rawValue: indexPath.section) else {return}
        switch it {
        case .delivering:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellid) as! MakePaymentTableViewCell
            cell.checkBox.isChecked = true
            cell.accessoryType = .checkmark
        case .ordering:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: cellid2) as! MakePaymentTableViewCell2
            cell2.checkBox.isChecked = true
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let it = PayMentSection(rawValue: indexPath.section) else {return}
        switch it {
        case .delivering:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellid) as! MakePaymentTableViewCell
          cell.checkBox.isChecked = false
            cell.accessoryType = .none
        case .ordering:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: cellid2) as! MakePaymentTableViewCell2
          cell2.checkBox.isChecked = false
            
            cell2.accessoryType = .none
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let head = tableView.dequeueReusableCell(withIdentifier: headid) as! MyDataLabelHead
        head.label_text.text = items[section]
        head.label_text.get_bold(size: 17)
        head.label_text.textColor = .custom_green()
        return head
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return PayMentSection.ordering.rawValue + 1
    }
    
    let tableView : UITableView = {
       let table = UITableView()
        
        return table
    }()
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
        tableView.snp.makeConstraints { (cons) in
            cons.edges.equalToSuperview()
        }
        
        tableView.register(MyDataLabelHead.self, forCellReuseIdentifier: headid)
        tableView.register(MakePaymentTableViewCell.self, forCellReuseIdentifier: cellid)

        tableView.register(MakePaymentTableViewCell2.self, forCellReuseIdentifier: cellid2)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





enum PayMentSection: Int {
    case delivering
    case ordering

}
