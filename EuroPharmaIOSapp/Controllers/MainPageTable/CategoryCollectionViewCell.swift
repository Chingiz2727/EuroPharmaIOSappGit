//
//  CategoryCollectionViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/16/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import Alamofire
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
        stack.spacing = 3
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var category : Category?  {didSet {
        updateUI()
        }
        
    }
    
   
    
    func adlayer() {
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
            cons.top.equalTo(30)
            cons.size.equalTo(50)
            
        }
        img.layer.cornerRadius = 30
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let contentViewConstraints = [
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        NSLayoutConstraint.activate(contentViewConstraints)
        adlayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func prepareForReuse() { //This prevents images/text etc being reused on another cell (wrong image/text displayed)
        super.prepareForReuse()
        
      
        
       
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
   
}
