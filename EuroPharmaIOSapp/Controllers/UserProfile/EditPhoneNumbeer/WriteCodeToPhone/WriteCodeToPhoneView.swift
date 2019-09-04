//
//  WriteCodeToPhoneView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 9/2/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import TextFieldEffects
class WriteCodeToPhoneView: UIView {

 let title_text = UILabel()
 let text_field = PassWordTextView()
 let code_title = UILabel()
    let code_textf = UITextField()
    let send = UIButton()
    let resend = UIButton()
    
    
    
    func addview() {
        self.addSubViews(withList: [title_text,text_field,code_title,code_textf,send,resend])
        title_text.snp.makeConstraints { (cons) in
            cons.top.equalToSuperview().inset(22)
            cons.left.right.equalToSuperview().inset(15)
        }
        title_text.numberOfLines = 0
        text_field.snp.makeConstraints { (cons) in
            cons.left.right.equalToSuperview().inset(15)
            cons.top.equalTo(title_text.snp.bottom).offset(16)
            cons.height.equalTo(44)
        }
        code_title.snp.makeConstraints { (cons) in
            cons.top.equalTo(text_field.snp.bottom).offset(15)
            cons.left.right.equalToSuperview().inset(15)
        }
        code_textf.snp.makeConstraints { (cons) in
            cons.left.equalToSuperview().inset(15)
            cons.width.equalTo(165)
            cons.top.equalTo(code_title.snp.bottom).offset(2)
            cons.height.equalTo(45)
        }
        send.layer.cornerRadius = 4
        code_textf.layer.cornerRadius = 4
        code_textf.setLeftPaddingPoints(10)
        text_field.text_field.setLeftPaddingPoints(10)
        code_textf.layer.borderWidth = 1
        code_textf.layer.borderColor = UIColor.custom_gray().cgColor
        code_textf.layer.cornerRadius = 4
        send.snp.makeConstraints { (cons) in
            cons.left.right.equalToSuperview().inset(15)
            cons.top.equalTo(code_textf.snp.bottom).offset(22)
            cons.height.equalTo(43)
        }
        send.backgroundColor = .custom_green()
        resend.snp.makeConstraints { (cons) in
            cons.top.equalTo(send.snp.bottom).offset(24)
            cons.left.equalToSuperview().inset(15)
        }
        title_text.get_bold(size: 17)
        title_text.textColor = .custom_gray()
        title_text.text = "Подтвердите изменение номера телефона"
        code_title.text = "Код подтверждения"
        code_title.get_regular(size: 13)
        code_title.textColor = .custom_gray_text()
        resend.titleLabel?.get_regular(size: 16)
        send.setTitle("Подтвердить", for: .normal)
        resend.setTitle("Повторно отправить код", for: .normal)
        resend.setTitleColor(.custom_gray_text(), for: .normal)
        self.backgroundColor = .white()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
