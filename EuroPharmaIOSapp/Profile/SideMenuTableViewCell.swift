//
//  SideMenuTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/15/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SnapKit

class SideMenuTableViewCell: UITableViewCell {
    
    let icon : UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    let menu : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 15)
        label.textAlignment = .left
        label.textColor = .custom_gray()
        return label
    }()
    
    let road : UILabel = {
       let label = UILabel()
        label.text = ">"
        label.textAlignment = .right
        label.textColor = .custom_gray()
        label.isHidden = false
        return label
    }()
    
    lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [icon,menu,road])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(stack)
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(10)
            cons.centerY.equalTo(self)
        }
        if icon.image != nil {
            icon.snp.makeConstraints { (cons) in
                cons.width.height.equalTo(35)
            }
        }
      
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    

}
