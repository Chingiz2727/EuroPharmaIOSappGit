//
//  ProfileHeaderTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
class ProfileHeaderTableViewCell: UITableViewCell {
    let photo = UILabel()
    let name = UILabel()
    let phone = UILabel()
    var results = try! Realm().objects(UserData.self)
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
        photo.layer.masksToBounds = false
        stack.customStack(view: [name,phone], distribution: .equalSpacing, spacing: 5)
        stack.axis = .vertical
        photo.layer.cornerRadius = 18
self.backgroundColor = .white
        photo.snp.makeConstraints { (cons) in
            cons.centerY.equalTo(self)
            cons.left.equalTo(self).inset(15)
            cons.width.height.equalTo(36)
        }
        let nam_it = Array(results.first!.first_name!)
        print(nam_it)
        photo.text = "\(nam_it[0])"
        photo.clipsToBounds = true
        photo.backgroundColor = .custom_green()
        photo.textAlignment = .center
        photo.textColor = .white()
        photo.get_regular(size: 17)
        name.get_bold(size: 17)
        name.textColor = .custom_gray()
        phone.textColor = .custom_gray()
        photo.get_regular(size: 13)
        name.text = (results.first?.first_name!)!
        phone.text = results.first?.phone!
        stack.snp.makeConstraints { (cons) in
            cons.left.equalTo(photo.snp.right).offset(10)
            cons.right.equalTo(self).inset(10)
            cons.centerY.equalTo(self)
        }
        photo.layoutIfNeeded()
        photo.sizeToFit()
    }

}
