//
//  StatusTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {
    let circle_img = UIImageView()
    let title = UILabel()
    let date = UILabel()
    lazy var stack = UIStackView()
    let upLine = UIView()
    let botLine = UIView()
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
 
        addSubview(circle_img)
        
        stack.customStack(view: [title,date], distribution: .fillProportionally, spacing: 4)
        stack.axis = .vertical
        addSubview(stack)
        stack.snp.makeConstraints { (cons) in
            cons.left.equalTo(circle_img.snp.right).offset(20)
            cons.centerY.equalToSuperview()
            cons.right.equalTo(self).inset(20)
        }
        circle_img.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(20)
            cons.centerY.equalToSuperview()
            cons.width.height.equalTo(33)
        }
        self.addSubview(upLine)
        self.addSubview(botLine)
        upLine.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(0)
            cons.centerX.equalTo(circle_img)
            cons.bottom.equalTo(circle_img.snp.top).inset(0)
            cons.width.equalTo(1)
        }
        botLine.snp.makeConstraints { (cons) in
            cons.top.equalTo(circle_img.snp.bottom).inset(0)
            cons.bottom.equalTo(self).inset(0)
            cons.centerX.equalTo(circle_img)
            cons.width.equalTo(1)
        }
        botLine.backgroundColor = .custom_gray()
        upLine.backgroundColor = .custom_gray()
        circle_img.backgroundColor = .custom_green()
        title.get_regular(size: 16)
        title.textColor = .custom_gray()
        date.get_regular(size: 13)
        date.textColor = .custom_gray()
        self.selectionStyle = .none
        circle_img.layer.cornerRadius = 17
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


class StatusData {
    var title : String?
    var time : String?
    init(title : String, time:String) {
        self.title = title
        self.time = time
    }
}
