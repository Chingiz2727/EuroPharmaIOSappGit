//
//  EditPhoneView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SwiftPhoneNumberFormatter
class EditPhoneView: UIView {
    let title = UILabel()
    let current = UILabel()
    let enter_l = UILabel()
    let send = UIButton()
    let phone : PhoneFormattedTextField = {
        let phone = PhoneFormattedTextField()
        phone.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: "(###) ###-##-##")
        phone.prefix = "+7 "
        phone.placeholder = "+7 (___) ___-__-__"
        return phone
    }()
    lazy var stack = UIStackView()
    let line = UIView()
    func add() {
        self.addSubview(stack)
        stack.customStack(view: [title,current,enter_l,phone,send], distribution: .fill, spacing: 15)
        stack.axis = .vertical
        title.CustomLabel(textAlignment: .center, color: .black, font: UIFont.boldSystemFont(ofSize: 24))
        title.text = "Изменить номер телефона"
        current.CustomLabel(textAlignment: .left, color: .black, font: UIFont(name: "Arial", size: 15)!)
        current.text = "Ваш текущий номер телефона +7(747)750-23-21"
        enter_l.CustomLabel(textAlignment: .left, color: .black, font: UIFont(name: "Arial", size: 15)!)
        enter_l.text = "Введите новый номер телефона"
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(20)
            cons.centerY.equalTo(self)
        }
        send.snp.makeConstraints { (cons) in
            cons.height.equalTo(45)
        }
        phone.snp.makeConstraints { (cons) in
            cons.height.equalTo(45)
        }
        self.addSubview(line)
        line.snp.makeConstraints { (cons) in
            cons.bottom.left.right.equalTo(phone).inset(0)
            
            cons.height.equalTo(1)
        }
        line.backgroundColor = .custom_green()
        send.setTitle("Отправить", for: .normal)
        send.backgroundColor = .custom_green()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        add()
        stack.sizeToFit()
        stack.layoutIfNeeded()
        title.numberOfLines = 0
        current.numberOfLines = 0
        enter_l.numberOfLines = 0
        
        self.backgroundColor = .white
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
