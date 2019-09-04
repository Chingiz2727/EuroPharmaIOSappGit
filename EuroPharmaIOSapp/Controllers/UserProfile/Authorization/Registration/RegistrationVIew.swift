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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField == phone) {
            let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            let components = newString.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
            let decimalString = components.joined(separator: "") as NSString
            let length = decimalString.length
            let hasLeadingOne = length > 0 && decimalString.hasPrefix("1")
            if length == 0 || (length > 10 && !hasLeadingOne) || length > 11 {
                let newLength = (textField.text! as NSString).length + (string as NSString).length - range.length as Int
                
                return (newLength > 10) ? false : true
            }
            var index = 0 as Int
            let formattedString = NSMutableString()
            if hasLeadingOne {
                formattedString.append("1 ")
                index += 1
            }
            if (length - index) > 3 {
                let areaCode = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("(%@)", areaCode)
                index += 3
            }
            if length - index > 3 {
                let prefix = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("%@-", prefix)
                index += 3
            }
            
            let remainder = decimalString.substring(from: index)
            formattedString.append(remainder)
            textField.text = formattedString as String
            return false
        }
        else {
            return true
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
