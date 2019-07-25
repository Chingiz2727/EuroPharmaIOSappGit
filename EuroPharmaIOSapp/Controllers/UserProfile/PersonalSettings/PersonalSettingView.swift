//
//  PersonalSettingView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import TextFieldEffects
class PersonalSettingView: UIView {

    let name : HoshiTextField = {
        let text = HoshiTextField()
        text.borderActiveColor = .custom_green()
        text.borderInactiveColor = .custom_gray()
        text.placeholder = "Имя"
        return text
    }()
  
    let surname : HoshiTextField = {
        let text = HoshiTextField()
        text.borderActiveColor = .custom_green()
        text.borderInactiveColor = .custom_gray()
        text.placeholder = "Фамилия"
        return text
    }()
    let title : UILabel = UILabel()
    
    let Email : HoshiTextField = {
        let text = HoshiTextField()
        text.borderActiveColor = .custom_green()
        text.borderInactiveColor = .custom_gray()
        text.placeholder = "Email"
        return text
    }()
    
    let send : UIButton = {
        let button = UIButton()
        button.backgroundColor = .custom_green()
        button.setTitle("Отправить", for: .normal)
        return button
    }()
    lazy var stack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addview()
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addview() {
        self.addSubview(stack)
        stack.customStack(view: [title,name,surname,Email,send], distribution: .fillEqually, spacing: 10)
        stack.axis = .vertical
        title.text = "Личная информация"
        title.CustomLabel(textAlignment: .center, color: .black, font: UIFont.boldSystemFont(ofSize: 24))
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(15)
            cons.centerY.equalTo(self)
            cons.height.equalTo(280)
        }
    }
}
