//
//  MyDataTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/12/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import TextFieldEffects
class MyDataTableViewCell: UITableViewCell {
    let textf : HoshiTextField = {
        let phone = HoshiTextField()
        phone.placeholderColor = .custom_gray()
        phone.borderInactiveColor = .custom_gray()
        return phone
    }()
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
        self.addSubview(textf)
        textf.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(15)
            cons.right.equalTo(self).inset(35)
            cons.height.equalTo(55)
            cons.top.bottom.equalTo(self).inset(15)
        }
        
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
