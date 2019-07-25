//
//  EditPassView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import TextFieldEffects
class EditPassView: UIView {
    let title : UILabel = UILabel()
    lazy var stack = UIStackView()
    let current_pass : HoshiTextField = {
        let text = HoshiTextField()
        text.isSecureTextEntry = true

        text.borderActiveColor = .custom_green()
        text.borderInactiveColor = .custom_gray()
        text.placeholder = "Текущий пароль"
        return text
    }()
    
    let new_pass : HoshiTextField = {
        let text = HoshiTextField()
        text.isSecureTextEntry = true

        text.borderActiveColor = .custom_green()
        text.borderInactiveColor = .custom_gray()
        text.placeholder = "Новый пароль"
        return text
    }()
    
    let re_new_pass : HoshiTextField = {
        let text = HoshiTextField()
        text.isSecureTextEntry = true
        text.borderActiveColor = .custom_green()
        text.borderInactiveColor = .custom_gray()
        text.placeholder = "Повторите новый пароль"
        return text
    }()
    
    let button = UIButton()
    
    func addview() {
        self.addSubview(stack)
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(15)
            cons.centerY.equalTo(self)
            cons.height.equalTo(340)
        }
        button.backgroundColor = .custom_green()
        button.setTitle("Сохранить", for: .normal)
        stack.customStack(view: [title,current_pass,new_pass,re_new_pass,button], distribution: .fillEqually, spacing: 15)
        stack.axis = .vertical
        title.CustomLabel(textAlignment: .center, color: .black, font: UIFont.boldSystemFont(ofSize: 20))
        title.text = "Изменить пароль"
        self.backgroundColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
