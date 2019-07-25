//
//  CategoryCollectionViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/16/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    let img : ImageLoader = {
       let img = ImageLoader()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .white
        return img
    }()
    
    let label : UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var stack : UIStackView = {
    let stack = UIStackView(arrangedSubviews: [img,label])
        stack.spacing = 7
        stack.axis = .vertical
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var category : Category?  {
        didSet {
            updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(stack)
        clipsToBounds = true

        stack.snp.makeConstraints { (cons) in
            cons.top.bottom.equalTo(self).inset(0)
            cons.left.right.equalTo(self).inset(0)
            
        }
        stack.sizeToFit()
        stack.layoutIfNeeded()
        self.backgroundColor = .white
        img.snp.makeConstraints { (cons) in
            cons.size.equalTo(100)
        }
    }
    
    func updateUI() {
        if let category = category {
//            img.image = interest.featuredImage
            if let url = category.icon {
                img.loadImageWithUrl(URL(string: url)!)
            }
            label.text = category.name ?? ""
        } else {
            img.image = nil
        }
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        label.numberOfLines = 0
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
