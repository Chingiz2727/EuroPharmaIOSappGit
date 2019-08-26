//
//  EditPassView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import TextFieldEffects
class EditPassView: UIView,UITextFieldDelegate {
    let title : UILabel = UILabel()
    var change: (()->Void)?
    lazy var stack = UIStackView()
    let show_new = UIButton()
    let show_re_new = UIButton()
    
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
        }
        current_pass.snp.makeConstraints { (cons) in
            cons.height.equalTo(55)
        }
        new_pass.snp.makeConstraints { (cons) in
            cons.height.equalTo(55)
        }
        re_new_pass.snp.makeConstraints { (cons) in
            cons.height.equalTo(55)
        }
        button.snp.makeConstraints { (cons) in
            cons.height.equalTo(45)
        }
        current_pass.delegate = self
        re_new_pass.delegate = self
        new_pass.delegate = self
        button.backgroundColor = .custom_green()
        button.setTitle("Изменить", for: .normal)
        button.layer.cornerRadius = 10
        stack.customStack(view: [current_pass,new_pass,re_new_pass,button], distribution: .fill, spacing: 15)
        stack.axis = .vertical
        button.addTarget(self, action: #selector(change_info), for: .touchUpInside)
        show_new.setImage(#imageLiteral(resourceName: "152"), for: .normal)
        show_re_new.setImage(#imageLiteral(resourceName: "152"), for: .normal)
        show_re_new.imageView?.contentMode = .scaleAspectFit
        show_new.imageView?.contentMode = .scaleAspectFit
        
        self.backgroundColor = .white
        addSubViews(withList: [show_new,show_re_new])
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
        
        show_new.addTarget(self, action: #selector(shownew), for: .touchUpInside)
        show_re_new.addTarget(self, action: #selector(showrenew), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addview()
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
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
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
        case current_pass:
            current_pass.placeholderColor = .custom_gray()
            current_pass.placeholder = "Текущий пароль"
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

enum Errors {
    case not_equal
    case less_new
    
    
}
