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
        
        stack.customStack(view: [name,city], distribution: .fillEqually, spacing: 5)
        stack.axis = .vertical
        stack.snp.makeConstraints { (cons) in
            cons.centerY.equalTo(self)
            cons.left.equalTo(self).inset(10)
        }
        city.text = "Алматы"
        name.text = "Raduga 44"
        name.CustomLabel(textAlignment: .left, color: .black, font: UIFont.init(name: "Arial", size: 16)!)
        city.CustomLabel(textAlignment: .left, color: .custom_gray(), font: UIFont.init(name: "Arial", size: 14)!)
    }

}
