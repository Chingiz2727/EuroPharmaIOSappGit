//
//  MainPageFooterTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/5/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MainPageFooterTableViewCell: UITableViewCell {
    
    let phone_img = UIImageView()
    let phone = UILabel()
    let title = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(phone_img)
        phone_img.image = #imageLiteral(resourceName: "Vector-4")
        
        phone_img.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(33)
            cons.height.equalTo(23)
            cons.width.equalTo(14)
            cons.top.equalTo(self).inset(10)
            cons.bottom.equalTo(self).inset(35)
        }
        self.selectionStyle = .none
        phone_img.contentMode = .scaleAspectFit
        self.addSubview(phone)
        phone.text = "3030"
        phone.get_regular(size: 33)
        phone.textColor = .custom_gray()
        
        phone.snp.makeConstraints { (cons) in
//            cons.top.bottom.equalTo(phone_img).inset(0)
            cons.left.equalTo(phone_img.snp.right).offset(10)
            cons.centerY.equalTo(phone_img)
        }
        self.addSubview(title)
        title.snp.makeConstraints { (cons) in
            cons.left.equalTo(phone.snp.right).offset(10)
            cons.centerY.equalTo(phone)
        }
        self.backgroundColor = .custom_white()
        title.get_regular(size: 13)
        title.text = "Режим работы 24/7"
        title.textColor = .gray
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
