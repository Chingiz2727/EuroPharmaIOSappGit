//
//  OrderStatView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/12/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class OrderStatView: UIView,UITableViewDelegate,UITableViewDataSource {
      let data = [StatusData(title: "Создан", time: "16.08.2019 / 12:38:02"),StatusData(title: "В обработке", time: "16.08.2019 / 12:38:03"),StatusData(title: "На доставке", time: "16.08.2019 / 12:40:56")]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! StatusTableViewCell
        cell.date.text = data[indexPath.row].time ?? ""
        cell.title.text = data[indexPath.row].title ?? ""
        if indexPath.row == 0 {
            cell.upLine.isHidden = true
        }
        if indexPath.row == data.count - 1 {
            cell.botLine.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }

    let title : UILabel = UILabel()
    let num_title : UILabel = UILabel()
    let textf : UITextField = UITextField()
    let button : UIButton = UIButton()
    let table = UITableView()
    lazy var stack : UIStackView = UIStackView()
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Покупатель : Shyngys"
    }
    func style() {
        title.get_bold(size: 20)
        title.textColor = .custom_gray()
        title.text = "Узнать о статусе своего заказа"
        title.numberOfLines = 0
        num_title.numberOfLines = 0
        num_title.get_regular(size: 18)
        num_title.textColor = .gray
        num_title.text = "Номер заказа"
        stack.customStack(view: [textf,button], distribution: .fillProportionally, spacing: 13)
        stack.axis = .horizontal
        button.setTitle("Найти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .custom_green()
        button.layer.cornerRadius = 6
        textf.layer.borderWidth = 1
        textf.layer.borderColor = UIColor.gray.cgColor
        textf.layer.cornerRadius = 6
        
    }
    let cellid = "ceellid"
    
    func addview() {
        self.addSubview(title)
        self.addSubview(num_title)
        self.addSubview(stack)
        self.addSubview(table)
        title.snp.makeConstraints { (cons) in
            cons.top.equalToSuperview().inset(22)
            cons.left.right.equalTo(self).inset(15)
        }
        num_title.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(15)
            cons.top.equalTo(title.snp.bottom).offset(11)
            
        }
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(15)
            cons.top.equalTo(num_title.snp.bottom).offset(10)
            cons.height.equalTo(43)
        }
        button.snp.makeConstraints { (cons) in
            cons.width.equalTo(87)
        }
        table.delegate = self
        table.dataSource = self
        table.register(StatusTableViewCell.self, forCellReuseIdentifier: cellid)
        table.snp.makeConstraints { (cons) in
            cons.left.right.bottom.equalToSuperview()
            cons.top.equalTo(button.snp.bottom).offset(18)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        addview()
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
