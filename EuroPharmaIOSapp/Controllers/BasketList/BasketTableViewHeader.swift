//
//  BasketTableViewHeader.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class BasketTableViewHeader: UITableViewCell {
    let label = UILabel()
    let removeButton = UIButton()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(label)
        label.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(20)
            cons.centerY.equalTo(self)
        }
        self.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Корзина"
        self.addSubview(removeButton)
        removeButton.snp.makeConstraints { (cons) in
            cons.right.equalTo(self).inset(20)
            cons.width.height.equalTo(30)
            cons.centerY.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
