//
//  ChooseCityView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/22/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class ChooseCityView: UIView {
   
    
    
    let img = UIImageView()
    let title = UILabel()
    let picker = UIPickerView()
    let button = UIButton()
    
    
    lazy var stack = UIStackView()
    
    func addview() {
        addSubview(stack)
        self.backgroundColor = .white()
        img.snp.makeConstraints { (cons) in
            cons.width.equalTo(180)
        }
        img.image = #imageLiteral(resourceName: "лого-2")
        img.contentMode = .scaleAspectFit
        title.textColor = #colorLiteral(red: 0.7411764706, green: 0.7529411765, blue: 0.7607843137, alpha: 1)
        title.text = "Выберите ваш регион"
        title.get_regular(size: 13)
        stack.customStack(view: [img,title,picker,button], distribution: .fill, spacing: 10)
        stack.axis = .vertical
        
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(20)
//            cons.top.equalTo(self).inset(40)
            
            cons.centerY.equalTo(self)
        }
        img.snp.makeConstraints { (cons) in
            cons.height.equalTo(105)
            cons.width.equalTo(195)
        }
        picker.snp.makeConstraints { (cons) in
            cons.height.equalTo(150)
        }
        button.snp.makeConstraints { (cons) in
            cons.height.equalTo(43)
        }
        
        button.backgroundColor = .gray
        button.isUserInteractionEnabled = false
        button.setTitle("Продолжить", for: .normal)
        
        
        title.textAlignment = .center
        button.layer.cornerRadius = 4
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
