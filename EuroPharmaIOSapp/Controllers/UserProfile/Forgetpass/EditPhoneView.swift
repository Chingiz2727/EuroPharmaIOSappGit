//
//  EditPhoneView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SwiftPhoneNumberFormatter
import RealmSwift
class EditPhoneView: UIView {
    var results = try! Realm().objects(UserData.self)

    let title = UILabel()
    let phone_title = UILabel()
    let phone_textf = UITextField()
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
        phone_textf.isUserInteractionEnabled = false
        phone_textf.text = results.first?.phone!
        phone_textf.layer.borderWidth = 1
        phone_textf.layer.borderColor = UIColor.gray.cgColor
        phone_textf.layer.cornerRadius = 4
        send_button.layer.cornerRadius = 4
        send_button.backgroundColor = .custom_green()
        phone_textf.setLeftPaddingPoints(10)
        phone_textf.setLeftPaddingPoints(10)
        title.text = "Запрос на сброс пароля"
        phone_title.text = "Мобильный телефон"
        send_button.setTitle("Отправить", for: .normal)
        
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
