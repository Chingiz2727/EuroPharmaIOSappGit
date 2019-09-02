//
//  RegistrationCodeView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/28/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class RegistrationCodeView: UIView {

    let title = UILabel()
    let text = UILabel()
    let code_title = UILabel()
    let code = UITextField()
    let send = UIButton()
    let re_send = UILabel()
    var phone : String?
    
    func addview() {
        self.addSubViews(withList: [title,text,code_title,code,send,re_send])
        
        title.snp.makeConstraints { (cons) in
            cons.top.equalToSuperview().inset(22)
            cons.left.equalToSuperview().inset(14)
        }
        
        text.snp.makeConstraints { (cons) in
            cons.top.equalTo(title.snp.bottom).offset(10)
            cons.left.equalToSuperview().inset(14)
            cons.right.equalToSuperview().inset(33)
        }
        
        code_title.snp.makeConstraints { (cons) in
            cons.top.equalTo(text.snp.bottom).offset(11)
            cons.left.equalToSuperview().inset(14)
        }
        code.snp.makeConstraints { (cons) in
            cons.left.equalToSuperview().inset(14)
            cons.top.equalTo(code_title.snp.bottom).offset(2)
            cons.width.equalTo(165)
            cons.height.equalTo(45)
        }
        
        send.snp.makeConstraints { (cons) in
            cons.top.equalTo(code.snp.bottom).offset(22)
            cons.left.right.equalToSuperview().inset(14)
            cons.height.equalTo(43)
        }
        send.layer.cornerRadius = 4
        re_send.snp.makeConstraints { (cons) in
            cons.top.equalTo(send.snp.bottom).offset(24)
            cons.left.equalToSuperview().inset(14)
        }
        
        title.get_bold(size: 17)
        title.textColor = .custom_gray()
        text.numberOfLines = 0
        text.get_regular(size: 16)
        text.textColor = .custom_gray()
        code_title.get_regular(size: 13)
        code_title.textColor = .custom_gray_text()
        code.textColor = .custom_gray()
        re_send.get_regular(size: 16)
        re_send.textColor = .custom_gray_text()
        title.text = "Введите код из SMS"
        text.text = "Мы отправили SMS с кодом подтверждения +7\(phone)"
        code_title.text = "Код подтверждения"
        re_send.text = "Повторно отправить код"
        code.layer.cornerRadius = 4
        code.setLeftPaddingPoints(11)
        code.withImage(direction: .Right, image: #imageLiteral(resourceName: "Vector-8"), colorSeparator: .clear, colorBorder: .clear)
        send.backgroundColor = .custom_green()
        code.layer.borderColor = UIColor.custom_gray().cgColor
        code.layer.borderWidth = 1
        send.setTitle("Подтвердить", for: .normal)
        send.setTitleColor(.white(), for: .normal)
        send.titleLabel?.get_regular(size: 16)
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
