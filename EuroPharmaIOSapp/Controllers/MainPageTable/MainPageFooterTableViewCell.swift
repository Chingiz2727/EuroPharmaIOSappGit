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
            cons.left.equalTo(self).inset(10)
            cons.width.height.equalTo(33)
            cons.top.bottom.equalTo(self).inset(20)
        }
        phone_img.contentMode = .scaleAspectFit
        self.addSubview(phone)
        phone.text = "3030"
        phone.font =  UIFont(name: "SegoeUI", size: 40)
        phone.textColor = .custom_gray()
        
        phone.snp.makeConstraints { (cons) in
            cons.top.bottom.equalTo(phone_img).inset(0)
            cons.left.equalTo(phone_img.snp.right).offset(10)
            cons.centerY.equalTo(phone_img)
        }
        self.addSubview(title)
        title.snp.makeConstraints { (cons) in
            cons.left.equalTo(phone.snp.right).offset(10)
            cons.centerY.equalTo(phone)
        }
        self.backgroundColor = .custom_white()
        
        title.text = "Режим работы 24/7"
        title.textColor = #colorLiteral(red: 0.7411764706, green: 0.7529411765, blue: 0.7607843137, alpha: 1)
    
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
