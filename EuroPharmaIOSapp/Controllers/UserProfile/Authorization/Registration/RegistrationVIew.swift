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
    
    let phone : TelephoneTextField = {
        let phone = TelephoneTextField()
        phone.placeholder = "Мобильный телефон"
        phone.borderActiveColor = .custom_gray()
        phone.borderInactiveColor = .custom_gray()
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
       self.addSubViews(withList: [Name,phone,password,register])
        Name.snp.makeConstraints { (cons) in
            cons.left.right.equalToSuperview().inset(13)
            cons.top.equalToSuperview().inset(16)
            cons.height.equalTo(50)
        }
        phone.snp.makeConstraints { (cons) in
            cons.top.equalTo(Name.snp.bottom).offset(13)
            cons.left.right.equalToSuperview().inset(13)
            cons.height.equalTo(50)
        }
        
        password.snp.makeConstraints { (cons) in
            cons.top.equalTo(phone.snp.bottom).offset(13)
            cons.left.right.equalToSuperview().inset(13)
            cons.height.equalTo(50)
        }
        register.snp.makeConstraints { (cons) in
            cons.top.equalTo(password.snp.bottom).offset(13)
            cons.left.right.equalToSuperview().inset(13)
            cons.height.equalTo(43)
        }
        register.layer.cornerRadius = 4
        phone.keyboardType = .phonePad
        phone.delegate = self
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let phoneTextField = textField as? TelephoneTextField else { return }
        phoneTextField.textFieldDidBeginEditing()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let telephoneTextField = textField as? TelephoneTextField else { return true }
        return telephoneTextField.checkTelephoneNumber(textField, shouldChangeCharactersIn: range, replacementString: string)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
