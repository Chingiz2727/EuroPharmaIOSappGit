//
//  AdressTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class AdressTableViewCell: UITableViewCell {
    let name = UILabel()
    let city = UILabel()
    lazy var stack = UIStackView()
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
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addview() {
        self.addSubview(stack)
        
        stack.customStack(view: [city,name], distribution: .fill, spacing: 5)
        stack.axis = .horizontal
        stack.snp.makeConstraints { (cons) in
            cons.left.top.bottom.equalTo(self).inset(15)
            cons.right.equalTo(self).inset(56)
        }
        name.numberOfLines = 0
        city.text = "Алматы"
        name.text = "пр. Аль Фараби 77/8, НП 7 здание Esentai mall, 2-й этаж"
        name.get_regular(size: 14)
        name.textAlignment = .left
        name.textColor = .custom_gray()
        city.get_regular(size: 16)
        city.textAlignment = .left
        city.textColor = .custom_gray()
        name.numberOfLines = 0
        stack.sizeToFit()
        stack.layoutIfNeeded()
    }

}
