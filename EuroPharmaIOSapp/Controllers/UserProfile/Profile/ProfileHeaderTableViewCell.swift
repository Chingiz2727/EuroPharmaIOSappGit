//
//  ProfileHeaderTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class ProfileHeaderTableViewCell: UITableViewCell {
    let photo = UIImageView()
    let name = UILabel()
    let phone = UILabel()
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
        self.addSubview(photo)
       
        
        photo.contentMode = .scaleToFill
        self.addSubview(stack)
        photo.image = #imageLiteral(resourceName: "UNADJUSTEDNONRAW_thumb_3ff")
        photo.layer.masksToBounds = false
        stack.customStack(view: [name,phone], distribution: .equalSpacing, spacing: 5)
        stack.axis = .vertical
        photo.layer.cornerRadius = 30
self.backgroundColor = .white
        photo.snp.makeConstraints { (cons) in
            cons.centerY.equalTo(self)
            cons.left.equalTo(self).inset(20)
            cons.width.height.equalTo(60)
        }
        photo.clipsToBounds = true


        name.CustomLabel(textAlignment: .left, color: .custom_gray(), font: UIFont.boldSystemFont(ofSize: 18))
        phone.CustomLabel(textAlignment: .left, color: .custom_gray(), font: UIFont.init(name: "Arial", size: 16)!)
        name.text = "Shyngys Kuandyk"
        phone.text = "+ 7 747 750 23 21"
        stack.snp.makeConstraints { (cons) in
            cons.left.equalTo(photo.snp.right).offset(10)
            cons.right.equalTo(self).inset(10)
            cons.centerY.equalTo(self)
        }
        photo.layoutIfNeeded()
        photo.sizeToFit()
    }

}
