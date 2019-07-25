//
//  ForgetPassView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SwiftPhoneNumberFormatter
class ForgetPassView: UIView {

    var title = UILabel()
    var title_t = UILabel()
    
    let phone : PhoneFormattedTextField = {
        let phone = PhoneFormattedTextField()
        phone.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: "(###) ###-##-##")
        phone.prefix = "+7 "
        phone.placeholder = "+7 (___) ___-__-__"
        return phone
    }()
    var bot_t = UILabel()
    let send = UIButton()
    let line = UIView()

    lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [title,title_t,phone,bot_t,send])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    func addview() {
        self.addSubview(stack)
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(20)
            cons.centerY.equalTo(self)
            cons.height.equalTo(240)
        }
        
       title.CustomLabel(textAlignment: .left, color: .custom_gray(), font: UIFont.boldSystemFont(ofSize: 20))
      title_t.CustomLabel(textAlignment: .left, color: .custom_gray(), font: UIFont.init(name: "Arial", size: 12) ?? UIFont())
       bot_t.CustomLabel(textAlignment: .left, color: .red, font: UIFont(name: "Arial", size: 12) ?? UIFont())
        title.text = "Запрос на сброс пароля"
        title_t.text = "Мобильный телефон"
        bot_t.text = "Необходимо заполнить «Мобильный телефон»"
        send.backgroundColor = .custom_green()
       phone.textAlignment = .left
        send.setTitle("Отправить", for: .normal)
        self.backgroundColor = .white
        self.addSubview(line)
        line.snp.makeConstraints { (cons) in
            cons.left.right.bottom.equalTo(phone).inset(0)
            cons.height.equalTo(0.5)
        }
        line.backgroundColor = .custom_green()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
