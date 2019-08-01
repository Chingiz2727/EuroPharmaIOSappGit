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
class LoginView: UIView {

    let title = UILabel()
    let line = UIView()
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
    let login_button : UIButton = {
       let login = UIButton()
        login.setTitle("Войти", for: .normal)
        login.backgroundColor = .custom_green()
        login.layer.cornerRadius = 10
        
        
        return login
    }()
    
    let forget : UIButton = {
        let login = UIButton()
        login.setTitle("Забыли пароль", for: .normal)
        login.setTitleColor(.custom_green(), for: .normal)
        login.layer.cornerRadius = 10
        return login
    }()
    
    let register : UIButton = {
        let login = UIButton()
        login.setTitle("Регистрация", for: .normal)
        login.setTitleColor(.custom_green(), for: .normal)
        login.layer.cornerRadius = 10
        return login
    }()
    
    lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [phone,password,login_button,stack_user])
        stack.spacing = 15
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var stack_user : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [forget,register])
        stack.spacing = 10
        stack.axis = .horizontal
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
            cons.height.equalTo(250)
        }
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
