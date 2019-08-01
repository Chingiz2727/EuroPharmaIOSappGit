//
//  FavouriteTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/25/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SwiftyStarRatingView
import Alamofire

class FavouriteTableViewCell: UITableViewCell {
    let img  = ImageLoader()
    let star_rating : SwiftyStarRatingView = {
        let star = SwiftyStarRatingView()
        star.maximumValue = 5
        star.minimumValue = 0
        star.isUserInteractionEnabled = false
        star.tintColor = .orange
        star.allowsHalfStars = true
        star.value = 4
        return star
    }()
    var module = FavouritesModule()  {
        didSet {
            name.text = module.name ?? ""
            cost.text = String(module.cost)
            img.loadImageWithUrl(URL(string: module.img_url ?? "")!)
        }
    }
    
    
    let name = UILabel()
    let cost = UILabel()
    let contain = UILabel()
    lazy var stack = UIStackView()
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(img)
        img.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(10)
            cons.width.equalTo(100)
            cons.height.equalTo(80)
            cons.left.equalTo(self).inset(10)
        }
        img.contentMode = .scaleAspectFit
        self.addSubview(star_rating)
        self.addSubview(name)
        self.addSubview(contain)
        self.addSubview(cost)
        star_rating.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(10)
            cons.left.equalTo(img.snp.right).offset(15)
            cons.height.equalTo(25)
            cons.width.equalTo(130)
        }
        name.numberOfLines = 0
        name.snp.makeConstraints { (cons) in
            cons.top.equalTo(star_rating.snp.bottom).offset(5)
            cons.left.equalTo(img.snp.right).offset(15)
            cons.right.equalTo(self).inset(10)
        }
        contain.snp.makeConstraints { (cons) in
            cons.top.equalTo(name.snp.bottom).offset(5)
            cons.left.equalTo(img.snp.right).offset(15)
            cons.right.equalTo(self).inset(10)
            
        }
        cost.snp.makeConstraints { (cons) in
            cons.top.equalTo(contain.snp.bottom).offset(5)
            cons.left.equalTo(img.snp.right).offset(15)
            cons.right.equalTo(self).inset(10)
            cons.bottom.equalTo(self).inset(10)
        }
     
        self.selectionStyle = .none
      
  
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
