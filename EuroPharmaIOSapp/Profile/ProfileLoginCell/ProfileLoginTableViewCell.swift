//
//  ProfileLoginTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/26/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
class ProfileLoginTableViewCell: UITableViewCell {
    
    let register_button = UIButton()
    let login_button = UIButton()
    let icon_name = UILabel()
    let name = UILabel()
    var profile : (()->Void)?
    let arrow = UILabel()
    lazy var stack = UIStackView()
    lazy var user_stack = UIStackView()
    let item = try? Realm().objects(UserData.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .custom_white()
        
        if item?.count != 0 {
            add_profile()
        }
        else {
            add_loginView()
        }
        self.backgroundColor = .custom_white()
    }
    
    func add_profile() {
        addSubview(user_stack)
        addSubview(arrow)
        self.isUserInteractionEnabled = true
        let gestrue = UITapGestureRecognizer.init(target: self, action: #selector(go_profile))
        self.addGestureRecognizer(gestrue)
        self.isUserInteractionEnabled = true
        user_stack.customStack(view: [icon_name,name], distribution: .fillProportionally, spacing: 10)
        user_stack.axis = .horizontal
        user_stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(15)
            cons.top.bottom.equalTo(self).inset(15)
        }
        arrow.snp.makeConstraints { (cons) in
            cons.centerY.equalTo(icon_name)
            cons.right.equalTo(self).inset(25)
        }
        arrow.text = ">"
        arrow.font = UIFont.init(name: "Arial", size: 22)
        icon_name.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(56)
        }
        icon_name.backgroundColor = .custom_green()
        name.text = item?.last?.first_name ?? ""
        let array = Array(item?.last?.first_name ?? "")
        name.textColor = .custom_gray()
        name.font = UIFont.init(name: "Arial", size: 20)
        icon_name.text = String(array[0])
        icon_name.textAlignment = .center
        icon_name.layoutIfNeeded()
        icon_name.textColor = .custom_gray()
        icon_name.clipsToBounds = true
        icon_name.layer.cornerRadius = 28
        icon_name.font = UIFont.boldSystemFont(ofSize: 30)
    }
    @objc func go_profile() {
        profile?()
    }
    
    func add_loginView() {
        self.addSubview(stack)
      
        stack.customStack(view: [register_button,login_button], distribution: .fillProportionally, spacing: 10)
        stack.axis = .horizontal
        self.addSubview(stack)
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(20)
            cons.height.equalTo(45)
            cons.top.bottom.equalTo(self).inset(30)
        }
        register_button.tag = 0
        login_button.tag = 1
        register_button.titleLabel?.font = UIFont.init(name: "Arial", size: 14)
        login_button.titleLabel?.font = UIFont.init(name: "Arial", size: 14)
        register_button.setTitle("ЗАРЕГИСТРИРОВАТЬСЯ", for: .normal)
        login_button.setTitle("ВОЙТИ", for: .normal)
        login_button.backgroundColor = .custom_gray()
        login_button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        register_button.backgroundColor = .custom_green()
        register_button.layer.cornerRadius = 10
        login_button.layer.cornerRadius = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
