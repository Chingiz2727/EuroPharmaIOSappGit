//
//  OrderStatView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/12/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class OrderStatView: UIView {

    let title : UILabel = UILabel()
    let num_title : UILabel = UILabel()
    let textf : UITextField = UITextField()
    let button : UIButton = UIButton()
    lazy var stack : UIStackView = UIStackView()
    
    
    func style() {
        title.get_bold(size: 20)
        title.textColor = .custom_gray()
        title.text = "Узнать о статусе своего заказа"
        title.numberOfLines = 0
        num_title.numberOfLines = 0
        num_title.get_regular(size: 18)
        num_title.textColor = .gray
        num_title.text = "Номер заказа"
        stack.customStack(view: [textf,button], distribution: .fillProportionally, spacing: 10)
        stack.axis = .horizontal
        button.setTitle("Найти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .custom_green()
        button.layer.cornerRadius = 6
        textf.layer.borderWidth = 1
        textf.layer.borderColor = UIColor.gray.cgColor
        textf.layer.cornerRadius = 6
        
    }
    
    func addview() {
        self.addSubview(title)
        self.addSubview(num_title)
        self.addSubview(stack)
        title.snp.makeConstraints { (cons) in
            cons.left.right.top.equalTo(self).inset(10)
        }
        num_title.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(10)
            cons.top.equalTo(title.snp.bottom).offset(10)
            
        }
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(10)
            cons.top.equalTo(num_title.snp.bottom).offset(10)
            cons.height.equalTo(40)
        }
        button.snp.makeConstraints { (cons) in
            cons.width.equalTo(90)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        addview()
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
