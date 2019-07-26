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
    lazy var stack = UIStackView()
    let item = try? Realm().objects(UserData.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .custom_white()
        if let user = item {
            
        }
        else {
            add_loginView()

        }
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
