//
//  CategoryListTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/17/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class CategoryListTableViewCell: UICollectionViewCell {
    
    let name : UILabel = {
        let name = UILabel()
        name.font = UIFont(name: "Arial", size: 18)
        name.textColor = .custom_gray()
        name.textAlignment = .center
        name.numberOfLines = 2
        return name
    }()
    var view : UIView = {
        let view = UIView()
        view.backgroundColor = .custom_green()
        return view
    }()
    let arrow : UILabel = {
       let arrow = UILabel()
        arrow.text = ">"
        arrow.font = UIFont(name: "Arial", size: 30)
        arrow.textAlignment = .right
        arrow.textColor = .custom_gray()
        return arrow
    }()
    lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [name,arrow])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(view)

        self.addSubview(name)
        view.layoutIfNeeded()
        view.snp.makeConstraints { (cons) in
            cons.top.bottom.equalTo(self).inset(0)
            cons.left.equalTo(self).inset(0)
            cons.width.equalTo(15)
        }
        self.backgroundColor = .white
        name.snp.makeConstraints { (cons) in
            cons.left.equalTo(view.snp.right).offset(5)
            cons.right.equalTo(self).inset(10)
            cons.centerY.equalTo(self)
            cons.top.bottom.equalTo(self).inset(3)
        }
      
    }
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        //Exhibit A - We need to cache our calculation to prevent a crash.
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        newFrame.size.width = CGFloat(ceilf(Float(size.width)))
        layoutAttributes.frame = newFrame
        
        return layoutAttributes
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
