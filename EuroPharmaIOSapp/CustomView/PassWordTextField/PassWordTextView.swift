//
//  PassWordTextView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 9/2/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import TextFieldEffects
class PassWordTextView: UIView {
    
    let see_button : UIButton = {
       let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "151"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(changeImage), for: .touchUpInside)
        return button
    }()
    
    
    
    let text_field : HoshiTextField = {
       let text_f = HoshiTextField()
        text_f.borderInactiveColor = .gray
        text_f.borderActiveColor = .custom_gray()
        text_f.placeholder = "Пароль"
        text_f.isSecureTextEntry = true
        return text_f
    }()
    
    @objc func changeImage() {
        if  text_field.isSecureTextEntry == true {
            see_button.setImage(#imageLiteral(resourceName: "152"), for: .normal)
            text_field.isSecureTextEntry = false
        }
        else {
            see_button.setImage(#imageLiteral(resourceName: "151"), for: .normal)
            text_field.isSecureTextEntry = true

        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews(withList: [text_field,see_button])
        text_field.snp.makeConstraints { (cons) in
            cons.edges.equalToSuperview()
        }
        text_field.setLeftPaddingPoints(10)
        see_button.snp.makeConstraints { (cons) in
            cons.right.equalTo(text_field).inset(0)
            cons.height.equalTo(20)
            cons.width.equalTo(24)
            cons.centerY.equalTo(text_field)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
