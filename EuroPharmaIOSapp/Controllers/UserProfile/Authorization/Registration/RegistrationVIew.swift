//
//  LoginView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import TextFieldEffects
import SwiftPhoneNumberFormatter
class RegistrationView: UIView {
    
    let title = UILabel()
    let line = UIView()
    let Name : HoshiTextField = {
        let phone = HoshiTextField()
        phone.placeholder = "Имя"
        phone.tintColor = .blue
        phone.borderActiveColor = .custom_green()
        phone.borderInactiveColor = .custom_green()
        return phone
    }()
    let phone : PhoneFormattedTextField = {
        let phone = PhoneFormattedTextField()
        phone.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: "(###) ###-##-##")
        phone.prefix = "+7 "
        phone.placeholder = "+7 (___) ___-__-__"
        return phone
    }()
    
    let password : HoshiTextField = {
        let phone = HoshiTextField()
        phone.placeholder = "Пароль"
        phone.tintColor = .blue
        phone.borderActiveColor = .custom_green()
        phone.borderInactiveColor = .custom_green()
        phone.isSecureTextEntry = true
        return phone
    }()

    

    
    let register : UIButton = {
        let login = UIButton()
        login.setTitle("Регистрация", for: .normal)
        login.setTitleColor(.custom_green(), for: .normal)
        login.layer.cornerRadius = 10
        return login
    }()
    
    lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [Name,phone,password,register])
        stack.spacing = 15
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(stack)
        self.addSubview(line)
        line.backgroundColor = .custom_green()
        line.snp.makeConstraints { (cons) in
            cons.bottom.left.right.equalTo(phone).inset(0)
            cons.height.equalTo(0.5)
        }
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(25)
            cons.centerY.equalTo(self)
            cons.height.equalTo(240)
        }
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
