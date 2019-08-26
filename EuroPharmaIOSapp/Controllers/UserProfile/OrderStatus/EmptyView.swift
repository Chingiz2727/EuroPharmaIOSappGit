//
//  EmptyView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/20/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class EmptyView:UIView {
    
    let icon  = UIImageView()
    let title = UILabel()
    let descript = UILabel()
    let button = UIButton()
    lazy var stack = UIStackView()
   
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addview() {
        self.backgroundColor = .white()
        title.textAlignment = .center
        descript.textAlignment = .center
        self.addSubview(stack)
        title.numberOfLines = 0
        descript.numberOfLines = 0
        title.get_bold(size: 18)
        title.textColor = .custom_gray()
        descript.get_regular(size: 16)
        descript.textColor = .custom_gray()
        stack.customStack(view: [icon,title,descript], distribution: .fill, spacing: 20)
        stack.axis = .vertical
        stack.snp.makeConstraints { (cons) in
            cons.center.equalTo(self)
            cons.left.right.equalTo(self).inset(40)
        }
        
        icon.snp.makeConstraints { (cons) in
            cons.size.equalTo(117)
        }
        icon.contentMode = .scaleAspectFit
        stack.sizeToFit()
        stack.layoutIfNeeded()
        self.addSubview(button)
        button.snp.makeConstraints { (cons) in
            cons.top.lessThanOrEqualTo(stack.snp.bottom).offset(20)
            cons.left.right.equalTo(self).inset(10)
            cons.height.equalTo(43)
        }
        button.setTitle("Перейти в каталог", for: .normal)
        button.setTitleColor(.white(), for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .custom_green()
    }
    
    func remove() {
        self.removeFromSuperview()
    }
}
