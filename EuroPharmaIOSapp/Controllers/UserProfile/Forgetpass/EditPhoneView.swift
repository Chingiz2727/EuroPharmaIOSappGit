//
//  EditPhoneView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SwiftPhoneNumberFormatter
class ForgetPassViews: UIView,UITextFieldDelegate {

    let title = UILabel()
    let phone_title = UILabel()
    let phone_textf : TelephoneTextField = {
        let phone = TelephoneTextField()
        phone.placeholder = "Мобильный телефон"
        phone.tintColor = .custom_gray()
        phone.textColor = .custom_gray()
        phone.borderActiveColor = .custom_gray()
        phone.borderInactiveColor = .custom_gray()
        phone.keyboardType = .phonePad
        phone.textColor = .custom_green()
        phone.layer.cornerRadius = 4
        phone.layer.borderWidth = 1
        phone.setLeftPaddingPoints(10)
        return phone
    }()
    let send_button = UIButton()
    
    
    
    func addviews() {
        addSubViews(withList: [title,phone_title,phone_textf,send_button])
        title.snp.makeConstraints { (cons) in
            cons.top.equalToSuperview().inset(22)
            cons.left.right.equalToSuperview().inset(15)
        }
        phone_title.snp.makeConstraints { (cons) in
            cons.left.right.equalToSuperview().inset(15)
            cons.top.equalTo(title.snp.bottom).offset(11)
        }
        phone_textf.snp.makeConstraints { (cons) in
            cons.left.right.equalToSuperview().inset(15)
            cons.top.equalTo(phone_title.snp.bottom).offset(1)
            cons.height.equalTo(43)
        }
        send_button.snp.makeConstraints { (cons) in
            cons.left.right.equalToSuperview().inset(15)
            cons.height.equalTo(43)
            cons.top.equalTo(phone_textf.snp.bottom).offset(22)
        }
        
        
        title.get_regular(size: 17)
        title.textColor = .custom_gray()
        phone_title.get_regular(size: 15)
        phone_title.textColor = .gray
        phone_textf.layer.borderWidth = 1
        phone_textf.layer.borderColor = UIColor.gray.cgColor
        phone_textf.layer.cornerRadius = 4
        send_button.layer.cornerRadius = 4
        send_button.backgroundColor = .custom_green()
        phone_textf.setLeftPaddingPoints(10)
        phone_textf.setLeftPaddingPoints(10)
        phone_textf.delegate = self
        title.text = "Запрос на сброс пароля"
        phone_title.text = "Мобильный телефон"
        send_button.setTitle("Отправить", for: .normal)
        phone_textf.keyboardType = .phonePad
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField == phone_textf) {
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
    
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    addviews()
        
        self.backgroundColor = .white()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
