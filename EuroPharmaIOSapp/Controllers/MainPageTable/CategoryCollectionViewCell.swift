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
        img.backgroundColor = .white
        img.layer.masksToBounds = false
        img.layer.cornerRadius = img.frame.height/2
        img.clipsToBounds = true
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
        stack.spacing = 10
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
        clipsToBounds = true
        self.addSubview(img)
        img.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(14)
//            cons.width.height.equalTo(50)
            cons.height.equalTo(40)
            cons.width.equalTo(43)
            
            cons.centerX.equalTo(self)
        }
        self.addSubview(label)
        label.snp.makeConstraints { (cons) in
            cons.top.equalTo(img.snp.bottom).offset(8)
            cons.left.right.equalTo(self).inset(5)
            cons.centerX.equalTo(self)
        }
        label.get_regular(size: 13)
        label.textColor = .custom_gray()
        label.numberOfLines = 2
//        img.layer.cornerRadius = 30
        img.contentMode = .scaleAspectFit
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
        self.backgroundColor = .white   
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func prepareForReuse() { //This prevents images/text etc being reused on another cell (wrong image/text displayed)
        super.prepareForReuse()
        
      
        
       
    }
    
    func getImage(name:String) -> UIImage {
        switch name {
        case "Лекарственные средства":
            return #imageLiteral(resourceName: "витамины3")
        case "Мать и дитя":
            return #imageLiteral(resourceName: "88")
        case "Красота и гигиена":
            return #imageLiteral(resourceName: "77")
        case "Витамины и бады":
            return #imageLiteral(resourceName: "99")
        case "Изделия мед. назначения":
            return #imageLiteral(resourceName: "10")
        default:
              return UIImage()
        }
      
    }
    
    func updateUI() {
        if let category = category {
//            img.image = interest.featuredImage
          img.image = getImage(name: category.name ?? "")
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
