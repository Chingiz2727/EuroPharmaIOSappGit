//
//  ProfileLoginTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/26/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
import TextFieldEffects
import SwiftPhoneNumberFormatter
class ProfileLoginTableViewCell: UITableViewCell,UITextFieldDelegate,Logining {
    var loginaction : (()->Void)?
    var error_action : ((_ error: String)->())?
    var filter = ["(",")","-"]
    func login() {
        var filtered_text = phone.text
        
            filtered_text = filtered_text?.replacingOccurrences(of: filter[0], with: "")
        filtered_text = filtered_text?.replacingOccurrences(of: filter[1], with: "")
        filtered_text = filtered_text?.replacingOccurrences(of: filter[2], with: "")
        filtered_text = "7" + filtered_text!
        network.MakeLogin(phone: filtered_text!, password: password.text!) { (error) in
            guard let error = error else {
                self.loginaction?()
                return
            }
            self.error_action?(error)
        }
    }
    
    var network: NetworkManager!

    let title = UILabel()
    let phone : HoshiTextField = {
        let phone = HoshiTextField()
        phone.placeholder = "Телефон"
        phone.tintColor = .custom_gray()
        phone.textColor = .custom_gray()
        phone.borderActiveColor = .custom_gray()
        phone.borderInactiveColor = .custom_gray()
        phone.keyboardType = .phonePad
        phone.textColor = .custom_gray()
        return phone
    }()
    
    let password : HoshiTextField = {
        let phone = HoshiTextField()
        phone.placeholder = "Пароль"
        phone.tintColor = .custom_gray()
        phone.textColor = .custom_gray()
        phone.borderActiveColor = .custom_gray()
        phone.borderInactiveColor = .custom_gray()
        phone.isSecureTextEntry = true
        return phone
    }()
    
    let login_button : UIButton = {
        let login = UIButton()
        login.setTitle("Войти", for: .normal)
        login.backgroundColor = .custom_green()
        login.layer.cornerRadius = 4
        login.titleLabel?.get_regular(size: 18)
        
        return login
    }()
    
    let forget : UILabel = {
        let login = UILabel()
        login.text = "Забыли пароль"
        login.textAlignment = .left
        login.get_regular(size: 15)
        login.textColor = .custom_gray()
        return login
    }()
    
    let register : UIButton = {
        let login = UIButton()
        login.setTitle("Регистрация", for: .normal)
        login.setTitleColor(.custom_green(), for: .normal)
        login.titleLabel?.get_regular(size: 18)
        login.layer.cornerRadius = 4
        return login
    }()
    
    lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [phone,password,login_button,forget])
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
        return stack
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
     
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
    let botview = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         self.contentView.addSubview(stack)
        phone.delegate = self
        password.delegate = self
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self.contentView).inset(25)
            cons.centerY.equalTo(self.contentView)
            cons.bottom.equalTo(self.contentView).inset(15)
        }
        phone.snp.makeConstraints { (cons) in
            cons.height.equalTo(55)
        }
        password.snp.makeConstraints { (cons) in
            cons.height.equalTo(55)
        }
        login_button.snp.makeConstraints { (cons) in
            cons.height.equalTo(45)
        }
        login_button.isUserInteractionEnabled = true

        self.contentView.backgroundColor = .white
    }
    
  
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionStyle = .none
   
    }

    
        
  
    
    
    
}
