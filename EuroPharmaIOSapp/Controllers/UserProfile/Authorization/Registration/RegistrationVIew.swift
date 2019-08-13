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
class RegistrationView: UIView,UITextFieldDelegate {
    
    let title = UILabel()
    let line = UIView()
    let Name : HoshiTextField = {
        let phone = HoshiTextField()
        phone.placeholder = "Имя"
        phone.tintColor = .blue
        phone.borderActiveColor = .custom_gray()
        phone.borderInactiveColor = .custom_gray()
        return phone
    }()
    
    let Email : HoshiTextField = {
        let phone = HoshiTextField()
        phone.placeholder = "Электронная почта"
        phone.tintColor = .blue
        phone.borderActiveColor = .custom_gray()
        phone.borderInactiveColor = .custom_gray()
        return phone
    }()
    let phone : HoshiTextField = {
        let phone = HoshiTextField()
        phone.placeholder = "Мобильный телефон"
        return phone
    }()
    
    let password : HoshiTextField = {
        let phone = HoshiTextField()
        phone.placeholder = "Пароль"
        phone.tintColor = .blue
        phone.borderActiveColor = .custom_gray()
        phone.borderInactiveColor = .custom_gray()
        phone.isSecureTextEntry = true
        return phone
    }()

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }

    
    let register : UIButton = {
        let login = UIButton()
        login.setTitle("Создать акккаунт", for: .normal)
        login.setTitleColor(.white, for: .normal)
        login.backgroundColor = .custom_green()
        login.layer.cornerRadius = 10
        return login
    }()
    
    lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [Name,Email,phone,password,register])
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
        line.backgroundColor = .custom_gray()
        line.snp.makeConstraints { (cons) in
            cons.bottom.left.right.equalTo(phone).inset(0)
            cons.height.equalTo(0.5)
        }
        stack.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(5)
            cons.left.right.equalTo(self).inset(25)
            cons.height.equalTo(330)
        }
        Email.keyboardType = .emailAddress
        phone.keyboardType = .phonePad
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
