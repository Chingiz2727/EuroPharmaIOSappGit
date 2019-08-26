//
//  MayBeUlikeCollectionViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/8/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MayBeUlikeCollectionViewCell: UICollectionViewCell {
    let img : ImageLoader = ImageLoader()
    let name = UILabel()
    let old_price = UILabel()
    let price = UILabel()
    let buy_button = UIButton()
    
    lazy var stack = UIStackView()
    
    
    
    func addview() {
        stack.customStack(view: [name,old_price,price], distribution: .fill, spacing: 7)
        stack.axis = .vertical
        addSubview(img)
        self.addSubview(stack)
        stack.snp.makeConstraints { (cons) in
            cons.bottom.equalTo(self).inset(7)
            cons.top.equalTo(img.snp.bottom).offset(7)
            cons.left.right.equalTo(self).inset(15)
        }
        img.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(98)
            cons.top.equalToSuperview().inset(21)
            cons.left.right.equalToSuperview().inset(33)
        }
        name.text = "Sebamed крем солнцезащитн..."
        price.text = "540" + tg_sign
        img.image = #imageLiteral(resourceName: "ab1768591e4ab2a9776dd743a1e4ec99")
        name.numberOfLines = 2
        name.get_regular(size: 15)
        price.get_bold(size: 15)
        old_price.attributedText = (String(760) + tg_sign).strikeThrough()
        old_price.get_regular(size: 13)
        name.textColor = .custom_gray()
        old_price.textColor = .gray
        self.addSubview(buy_button)
        img.contentMode = .scaleAspectFit
        buy_button.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(28)
            cons.right.equalTo(self).inset(15)
            cons.bottom.equalTo(self).inset(10)
        }
        buy_button.layer.cornerRadius = 14
        buy_button.backgroundColor = .custom_green()
        buy_button.setImage(#imageLiteral(resourceName: "Group"), for: .normal)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addview()
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
