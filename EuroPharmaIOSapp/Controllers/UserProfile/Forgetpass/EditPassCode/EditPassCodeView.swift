//
//  EditPassCodeView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/26/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import TextFieldEffects
class EditPassCodeView: UIView,UITextFieldDelegate {
    let title =  UILabel()
    let newp_title = UILabel()
    var change: (()->Void)?
    var phone : String?
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
    
    let show_new = UIButton()
    let show_re_new = UIButton()
    let button = UIButton()
    let code_title = UILabel()
    let code = UITextField()
    let re_send = UIButton()
    
    func addview() {
        
       addSubViews(withList: [title,newp_title,new_pass,re_new_pass,show_new,show_re_new,button,code_title,code,re_send])
        title.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(22)
            cons.left.equalTo(self).inset(15)
            cons.right.equalTo(self).inset(10)
        }
        title.numberOfLines = 0
        title.sizeToFit()
        title.layoutIfNeeded()
        newp_title.snp.makeConstraints { (cons) in
            cons.top.equalTo(title.snp.bottom).offset(11)
            cons.left.equalTo(self).inset(15)
        }
        
        new_pass.snp.makeConstraints { (cons) in
            cons.top.equalTo(newp_title.snp.bottom).offset(1)
            cons.left.right.equalTo(self).inset(15)
            cons.height.equalTo(53)
        }
        re_new_pass.snp.makeConstraints { (cons) in
            cons.top.equalTo(new_pass.snp.bottom).offset(11)
            cons.left.right.equalTo(self).inset(15)
            cons.height.equalTo(53)
        }
        code_title.snp.makeConstraints { (cons) in
            cons.top.equalTo(re_new_pass.snp.bottom).offset(25)
            cons.left.equalTo(self).inset(15)
        }
        code.snp.makeConstraints { (cons) in
            cons.top.equalTo(code_title.snp.bottom).offset(2)
            cons.left.equalTo(self).inset(15)
            cons.width.equalTo(165)
            cons.height.equalTo(45)
        }
        
        button.snp.makeConstraints { (cons) in
            cons.top.equalTo(code.snp.bottom).offset(22)
            cons.left.right.equalTo(self).inset(15)
            
            cons.height.equalTo(43)
        }
        re_send.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(15)
            cons.top.equalTo(button.snp.bottom).offset(24)
        }
        title.get_regular(size: 14)
        title.textColor = .custom_gray_text()
        code_title.textColor = .custom_gray_text()
        code_title.get_regular(size: 13)
        
        re_new_pass.delegate = self
        new_pass.delegate = self
        button.backgroundColor = .custom_green()
        button.setTitle("Сохранить", for: .normal)
        button.layer.cornerRadius = 4
//        button.addTarget(self, action: #selector(change_info), for: .touchUpInside)
        show_new.setImage(#imageLiteral(resourceName: "152"), for: .normal)
        show_re_new.setImage(#imageLiteral(resourceName: "152"), for: .normal)
        show_re_new.imageView?.contentMode = .scaleAspectFit
        show_new.imageView?.contentMode = .scaleAspectFit
        
        self.backgroundColor = .white
        show_new.snp.makeConstraints { (cons) in
            cons.right.equalTo(new_pass).inset(0)
            cons.height.equalTo(15)
            cons.centerY.equalTo(new_pass)
        }
        show_re_new.snp.makeConstraints { (cons) in
            cons.right.equalTo(re_new_pass).inset(0)
            cons.centerY.equalTo(re_new_pass)
            cons.height.equalTo(15)
        }
        code.layer.borderWidth = 1
        code.layer.borderColor = UIColor.custom_gray().cgColor
        code.setLeftPaddingPoints(5)
        show_new.addTarget(self, action: #selector(shownew), for: .touchUpInside)
        show_re_new.addTarget(self, action: #selector(showrenew), for: .touchUpInside)
        title.text = "Введите новый пароль для телефона: \(phone)"
        code_title.text = "Код подтверждения"
        re_send.setTitle("Повторно отправить код", for: .normal)
        button.addTarget(self, action: #selector(change_info), for: .touchUpInside)
        
        self.backgroundColor = .white()
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func shownew() {
        switch show_new.imageView?.image {
        case #imageLiteral(resourceName: "152"):
            show_new.setImage(#imageLiteral(resourceName: "151"), for: .normal)
            new_pass.isSecureTextEntry = false
        default:
            show_new.setImage(#imageLiteral(resourceName: "152"), for: .normal)
            new_pass.isSecureTextEntry = true
        }
    }
    @objc func showrenew() {
        switch show_re_new.imageView?.image {
        case #imageLiteral(resourceName: "152"):
            show_re_new.setImage(#imageLiteral(resourceName: "151"), for: .normal)
            re_new_pass.isSecureTextEntry = false
        default:
            show_re_new.setImage(#imageLiteral(resourceName: "152"), for: .normal)
            re_new_pass.isSecureTextEntry = true
        }
    }
    
    
    @objc func change_info() {
        var checking = check()
        if checking == true {
            change?()
        }
    }
    
    func check() -> Bool {
        if re_new_pass.text! != new_pass.text!  {
            textf_errorss(error: .not_equal)
            return false
        }
        
        if new_pass.text! != re_new_pass.text!  {
            textf_errorss(error: .not_equal)
            return false
        }
        
        if new_pass.text!.count < 6 || re_new_pass.text!.count < 6  {
            textf_errorss(error: .less_new)
            return false
        }
        if re_new_pass.text!.count < 6 || new_pass.text!.count < 6  {
            textf_errorss(error: .less_new)
            return false
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case re_new_pass:
            re_new_pass.placeholderColor = .custom_gray()
            re_new_pass.placeholder = "Повторите новый пароль"
            re_new_pass.borderInactiveColor = .custom_gray()
        case new_pass:
            new_pass.placeholderColor = .custom_gray()
            new_pass.placeholder = "Новый пароль"
            new_pass.borderInactiveColor = .custom_gray()
        default:
            break
        }
        return true
    }
    
    func textf_errorss(error:Errors) {
        switch error {
        case .not_equal:
            re_new_pass.placeholder = "Пароль неверный"
            re_new_pass.placeholderColor = .red
            re_new_pass.borderInactiveColor = .red
        case .less_new:
            new_pass.placeholder = "Пароль должен быть не менее 6 символов"
            new_pass.placeholderColor = .red
            new_pass.borderInactiveColor = .red
        }
        
        
    }
    
}
