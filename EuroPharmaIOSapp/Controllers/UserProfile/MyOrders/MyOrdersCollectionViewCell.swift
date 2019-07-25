//
//  MyOrdersCollectionViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MyOrdersCollectionViewCell: UICollectionViewCell {
    var img = UIImageView()
    var name = UILabel()
    var count = UILabel()
    lazy var stack = UIStackView()
    
    func addview() {
        self.addSubview(img)
        img.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(15)
            cons.centerY.equalTo(self)
            cons.width.height.equalTo(140)
        }
        stack.customStack(view: [name,count], distribution: .fillProportionally, spacing: 10)
        stack.axis = .vertical
        self.addSubview(stack)
        stack.snp.makeConstraints { (cons) in
            cons.left.equalTo(img.snp.right).offset(15)
            cons.right.equalTo(self).inset(10)
            cons.centerY.equalTo(self)
        }
        name.CustomLabel(textAlignment: .left, color: .custom_green(), font: UIFont.boldSystemFont(ofSize: 20))
        count.CustomLabel(textAlignment: .left, color: .custom_gray(), font: UIFont(name: "Arial", size: 16)!)
        img.image = #imageLiteral(resourceName: "ab1768591e4ab2a9776dd743a1e4ec99")
        name.numberOfLines = 0
        name.text = "Но шпа"
        count.text = "Количество: 14"
        img.contentMode = .scaleAspectFit
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
