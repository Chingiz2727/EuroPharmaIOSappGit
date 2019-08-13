//
//  ContentSettingView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/5/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class ContentSettingView: UIView {
    var by_name : UIButton = {
        let like = UIButton()
        
        like.setImage(#imageLiteral(resourceName: "Group 5"), for: .normal)
        //        like.frame =   CGRect(x: 0, y: 0, width: 140, height: 40)
        like.setTitle("По названию", for: .normal)
        
        like.imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: like.bounds.width)
        like.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        like.titleLabel?.get_regular(size: 14)
        
        like.imageView?.contentMode = .scaleAspectFit
        like.backgroundColor = UIColor.clear
        like.setTitleColor(.custom_gray(), for: .normal)
        return like
    }()
    
    var filter : UIButton = {
        let like = UIButton()
        
        like.setImage(#imageLiteral(resourceName: "Group 2"), for: .normal)
        //        like.frame =   CGRect(x: 0, y: 0, width: 140, height: 40)
        like.setTitle("Фильтр", for: .normal)
        
        like.imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: like.bounds.width)
        like.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        like.titleLabel?.get_regular(size: 14)
        like.setTitleColor(.custom_gray(), for: .normal)
        like.imageView?.contentMode = .scaleAspectFit
        like.backgroundColor = UIColor.clear
        
        return like
    }()
    lazy var stack = UIStackView()
    let content = UIButton()
    
    func addview() {
        stack.customStack(view: [content,by_name,filter], distribution: .fill, spacing: 10)
        stack.axis = .horizontal
        content.setImage(#imageLiteral(resourceName: "Group 4"), for: .normal)
        addSubview(stack)
        content.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(25)
        }
        content.imageView?.contentMode = .scaleAspectFit
        stack.snp.makeConstraints { (cons) in
            cons.top.bottom.equalTo(self).inset(5)
            cons.left.right.equalTo(self).inset(15)
        }
      
        self.backgroundColor = .custom_white()
}
    override init(frame: CGRect) {
        super.init(frame: frame)
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
