//
//  MyOrdersDetailBottomTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MyOrdersDetailBottomTableViewCell: UITableViewCell {
    let name = UILabel()
    let count = UILabel()
    lazy var stack = UIStackView()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func addview() {
        stack.customStack(view: [name,count], distribution: .fillEqually, spacing: 10)
        stack.axis = .horizontal
        name.textAlignment = .left
        
        count.textAlignment = .right
        addSubview(stack)
        stack.snp.makeConstraints { (cons) in
            cons.centerY.equalToSuperview()
            cons.edges.equalToSuperview().inset(10)
        }
        if name.text == "Итого" || name.text == "Оплата" {
            name.get_bold(size: 18)
            count.get_bold(size: 19)
        }
        self.selectionStyle = .none
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addview()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
