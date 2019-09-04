//
//  WritePhoneView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 9/2/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class WritePhoneView: UIView {
    let title_text = UILabel()
    let text_field = UITextField()
    let send_button = UIButton()
    
    func addview() {
        self.addSubViews(withList: [title_text,text_field,send_button])
        title_text.snp.makeConstraints { (cons) in
            cons.left.equalToSuperview().inset(15)
            cons.top.equalToSuperview().inset(22)
        }
        
        text_field.snp.makeConstraints { (cons) in
            cons.left.right.equalToSuperview().inset(15)
            cons.height.equalTo(43)
            cons.top.equalTo(title_text.snp.bottom).offset(6)
        }
        
        send_button.snp.makeConstraints { (cons) in
            cons.left.right.equalToSuperview().inset(15)
            cons.top.equalTo(text_field.snp.bottom).offset(22)
            cons.height.equalTo(43)
        }
        text_field.setLeftPaddingPoints(10)
        title_text.text = "Введите новый номер телефона"
        title_text.get_regular(size: 16)
        title_text.textColor = .custom_gray()
        text_field.layer.cornerRadius = 4
        text_field.layer.borderWidth = 1
        text_field.layer.borderColor = UIColor.custom_gray().cgColor
        send_button.backgroundColor = .custom_green()
        send_button.setTitle("Отправить", for: .normal)
        self.backgroundColor = .white()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addview()
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
