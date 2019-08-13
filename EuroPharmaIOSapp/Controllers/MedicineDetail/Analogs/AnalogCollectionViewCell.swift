//
//  AnalogCollectionViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/6/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
class AnalogCollectionViewCell: UICollectionViewCell {
    let product_image = ImageLoader()
    var name = UILabel()
    var company = UILabel()
    var price = UILabel()
    var like_button = UIButton()
    var buy_button = UIButton()
    var minus_button = UIButton()
    var plus_button = UIButton()
    var count_label = UILabel()
    lazy var buy_stack = UIStackView()
    lazy var stack = UIStackView()
    func check()
    {
        let results = try! Realm().objects(FavouritesModule.self)
        if results.contains(where: {($0.id == self.id)}) {
            self.like_button.setImage(#imageLiteral(resourceName: "333"), for: .normal)
        }
        else {
            self.like_button.setImage(#imageLiteral(resourceName: "Vector-5"), for: .normal)
        }
    }
    var id : Int = 0 {
        didSet {
            check()
        }
    }
    func addview(){
        product_image.contentMode = .scaleAspectFit
        addSubview(product_image)
        product_image.snp.makeConstraints { (cons) in
            cons.top.bottom.equalTo(self).inset(20)
            cons.left.equalTo(self).inset(10)
            cons.width.equalTo(70)
            cons.height.equalTo(101)
        }
        name.numberOfLines = 2
        addSubview(like_button)
        like_button.snp.makeConstraints { (cons) in
            cons.top.right.equalToSuperview().inset(5)
            cons.width.height.equalTo(30)
        }
        buy_button.setTitle("Купить", for: .normal)
        buy_button.setTitleColor(.white, for: .normal)
        buy_button.backgroundColor = #colorLiteral(red: 0.7725490196, green: 0.8901960784, blue: 0.09803921569, alpha: 1)
        //        buy_button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        addSubview(buy_button)
        
        
        price.textColor = .custom_gray()
        
        name.get_regular(size: 16)
        company.get_regular(size: 16)
        company.textColor = .custom_gray_text()
        price.get_bold(size: 18)
        
        stack.customStack(view: [name,company], distribution: .fill, spacing: 3)
        stack.axis = .vertical
        addSubview(stack)
        self.addSubview(price)
        buy_button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        buy_button.layer.cornerRadius = 5
        buy_button.snp.makeConstraints { (cons) in
            cons.right.equalTo(self).inset(15)
            cons.bottom.equalToSuperview().inset(15)
            cons.width.equalTo(100)
        }
        stack.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(15)
            cons.left.equalTo(product_image.snp.right).offset(15)
            cons.right.equalTo(like_button.snp.left).offset(5)
        }
        price.snp.makeConstraints { (cons) in
            cons.top.equalTo(stack.snp.bottom).offset(3)
            cons.left.equalTo(product_image.snp.right).offset(15)
            
        }
        
        
        
        price.draw(CGRect(x: 0, y: 0, width: 100, height: 30))
        like_button.addTarget(self, action: #selector(like), for: .touchUpInside)
        self.backgroundColor = .white
        buy_button.addTarget(self, action: #selector(addbuyButton), for: .touchUpInside)
        
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addview()
        check()
        
    }
    
    var viewModule : Analog? {
        willSet(viewModule) {
            guard  let analog = viewModule else {
                return
            }
            self.id = analog.id ?? 0
            name.text = analog.name ?? ""
            price.text = String(analog.price ?? 0) + " ₸"
            product_image.loadImageWithUrl(URL(string: analog.img ?? "")!)
            
        }
    }
    @objc func like() {
        if (like_button.imageView?.image == UIImage(named: "333")) {
            
            remove_fav()
        } else{
            
            add_toFav()
        }
        
    }
    
    
    
    @objc func remove_fav() {
        guard  let viewModule = viewModule else {
            return
        }
        let realm = try? Realm()
        let results = try! Realm().objects(FavouritesModule.self)
        for i in results {
            if i.id == viewModule.id {
                try? realm?.write {
                    realm?.delete(i)
                    like_button.setImage(UIImage(named: "Vector-5"), for: .normal)
                    
                }
            }
        }
        
    }
    
    func add_toFav() {
        guard  let viewModule = viewModule else {
            return
        }
        let realm = try? Realm()
        let fav = FavouritesModule()
        var fav_list = [FavouritesModule]()
        fav.id = viewModule.id ?? 0
        fav.cost = viewModule.price ?? 0
        fav.img_url = viewModule.img ?? ""
        fav.name = viewModule.name ?? ""
        fav_list.append(fav)
        try? realm?.write {
            realm?.add(fav_list)
            like_button.setImage(UIImage(named: "333"), for: .normal)
            
        }
    }
    let buy_view = UIView()
    
    @objc func addbuyButton(){
        addSubview(buy_view)
        buy_view.addSubview(buy_stack)
        buy_view.layer.cornerRadius = 3
        buy_view.layer.borderWidth = 1
        buy_view.layer.borderColor = UIColor.custom_green().cgColor
        buy_view.snp.makeConstraints { (cons) in
            cons.top.right.bottom.left.equalTo(buy_stack).inset(0)
        }
        buy_stack.customStack(view: [minus_button,count_label,plus_button], distribution: .fillProportionally, spacing: 0)
        buy_stack.axis = .horizontal
        buy_button.removeFromSuperview()
        minus_button.setTitle("-", for: .normal)
        minus_button.setTitleColor(.custom_green(), for: .normal)
        plus_button.setTitleColor(.custom_green(), for: .normal)
        plus_button.setTitle("+", for: .normal)
        count_label.text = "1"
        count_label.textColor = .custom_green()
        buy_stack.snp.makeConstraints { (cons) in
            cons.right.equalTo(self).inset(15)
            cons.bottom.equalTo(self).inset(15)
            cons.width.equalTo(100)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
