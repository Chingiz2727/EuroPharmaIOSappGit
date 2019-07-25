//
//  MedicineCollectionViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/17/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MedicineCollectionViewCell: UICollectionViewCell {
    let container = UIView()
    let img : ImageLoader = {
        let img = ImageLoader()
        img.image = #imageLiteral(resourceName: "ab1768591e4ab2a9776dd743a1e4ec99")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let descript : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 14)
        label.text = "Нестле каша молочная Овсяная М 220 гр 4 Нестле каша молочная Овсяная М 220 гр 4 Нестле каша молочная Овсяная М 220 гр 4 Нестле каша молочная Овсяная М 220 гр 4"
        label.numberOfLines = 3
        
        return label
    }()
    
    let circle : UIView = {
        let circle = UIView()
        circle.backgroundColor = .custom_green()
        circle.layer.cornerRadius = 7
        return circle
    }()
    
    let order_button : UIButton = {
        let order = UIButton()
        order.setTitle("В корзину", for: .normal)
        order.setTitleColor(.custom_gray(), for: .normal)
        order.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        order.layer.borderColor = UIColor.custom_gray().cgColor
        order.layer.borderWidth = 1
        order.layer.cornerRadius = 5
        return order
    }()
    let oldPrice : UILabel = {
        let old = UILabel()
        old.textColor = .red
        old.font = UIFont(name: "Arial", size: 17)
        var text : NSAttributedString?
        old.attributedText = "12 000".strikeThrough()
        return old
    }()
    
    let Price : UILabel = {
        let price = UILabel()
        price.text = "10 000"
        price.font = UIFont.boldSystemFont(ofSize: 20)
        
       return price
    }()
    lazy var text_stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [descript,oldPrice,Price,order_button])
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
   
    func addview() {
       
        self.addSubview(img)
        self.addSubview(circle)
        self.backgroundColor = .white

        circle.snp.makeConstraints { (cons) in
            cons.right.equalTo(self).inset(10)
            cons.width.height.equalTo(14)
            cons.top.equalTo(self).inset(10)
        }
        img.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(3)
            cons.height.equalTo(140)
            cons.width.equalTo(120)
            cons.centerY.equalTo(self)
        }
        self.addSubview(text_stack)
        text_stack.snp.makeConstraints { (cons) in
            cons.left.equalTo(img.snp.right).offset(1)
            cons.right.equalTo(circle.snp.left).offset(-1)
            cons.centerY.equalTo(self)
        }
        text_stack.sizeToFit()
        text_stack.layoutIfNeeded()
       
    }
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
