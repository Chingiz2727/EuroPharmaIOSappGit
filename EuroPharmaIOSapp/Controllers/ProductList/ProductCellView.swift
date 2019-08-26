//
//  ProductCellView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/8/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class ProductCellView:UIView {
    let product_image = ImageLoader()
    var name = UILabel()
    var company = UILabel()
    var price = UILabel()
    var favourite = FavouriteView()

    var BuyButton = InitBuy()
    lazy var stack = UIStackView()
   
    lazy var bot_stack = UIStackView()
    
    
    var id : Int = 0 {
        didSet {
            favourite.check(id: id)
        }
    }
    
    func addview2() {
        product_image.contentMode = .scaleAspectFit
        addSubview(product_image)
        addSubview(favourite)
        favourite.snp.makeConstraints { (cons) in
            cons.top.equalToSuperview().inset(10)
            cons.right.equalToSuperview().inset(15)
            cons.width.height.equalTo(21)
        }
        product_image.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(23)
            cons.left.right.equalTo(self).inset(10)
            cons.height.equalTo(94)
            cons.width.equalTo(121)
        }
        
        name.numberOfLines = 2
        
       
        
        
        price.textColor = .custom_gray()
        
        name.get_regular(size: 16)
        company.get_regular(size: 15)
        company.textColor = .custom_gray_text()
        price.get_bold(size: 16)
        
        stack.customStack(view: [name,company], distribution: .fill, spacing: 3)
        stack.axis = .vertical
        addSubview(stack)
        stack.snp.makeConstraints { (cons) in
            cons.top.equalTo(product_image.snp.bottom).offset(21)
            cons.left.equalTo(self).inset(7)
            cons.right.equalToSuperview().inset(9)
        }
        self.addSubview(bot_stack)
        bot_stack.customStack(view: [price,BuyButton], distribution: .fillProportionally, spacing: 6)
        bot_stack.axis = .horizontal
        bot_stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(10)
            cons.top.equalTo(company.snp.bottom).offset(7)
            cons.bottom.equalTo(self).inset(14)
            cons.height.equalTo(33)
        }
        BuyButton.snp.makeConstraints { (cons) in
            cons.width.equalTo(66)
        }
     
       
    }
    
    func addview(){
        product_image.contentMode = .scaleAspectFit
        addSubview(product_image)
        product_image.snp.makeConstraints { (cons) in
            cons.top.bottom.equalTo(self).inset(20)
            cons.left.equalTo(self).inset(10)
            cons.width.equalTo(79)
            cons.height.equalTo(61)
        }
        name.numberOfLines = 2
        addSubview(favourite)
        favourite.snp.makeConstraints { (cons) in
            cons.top.equalToSuperview().inset(19)
            cons.right.equalToSuperview().inset(15)
            cons.width.equalTo(22)
            cons.height.equalTo(20)
        }
        
        
        
        price.textColor = .custom_gray()
        
        name.get_regular(size: 16)
        company.get_regular(size: 15)
        company.textColor = .custom_gray_text()
        price.get_bold(size: 16)
        
        stack.customStack(view: [name,company], distribution: .fill, spacing: 2)
        stack.axis = .vertical
        addSubview(stack)
        self.addSubview(price)
        
        stack.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(15)
            cons.left.equalTo(product_image.snp.right).offset(15)
            cons.right.equalTo(favourite.snp.left).offset(-15)
        }
        price.snp.makeConstraints { (cons) in
            cons.top.equalTo(stack.snp.bottom).offset(12)
            
            cons.left.equalTo(product_image.snp.right).offset(15)
            
            
        }
        
        self.addSubview(BuyButton)
        
        BuyButton.snp.makeConstraints { (cons) in
            cons.right.equalTo(self).inset(15)
            cons.width.equalTo(99)
            cons.bottom.equalTo(self).inset(16)
            cons.height.equalTo(33)
        }
        
        price.draw(CGRect(x: 0, y: 0, width: 100, height: 30))
        self.backgroundColor = .white
        
    }
   
    
    
    var nameI : String?
    var priceI : Int?
    var companyI : String?
    var imgI : String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white()
        name.textColor = .custom_gray()
        company.textColor = .custom_gray()
        
    }
    
    var viewModule : ProductViewCellModuleType? {
        willSet(viewModule) {
            guard  let viewModule = viewModule else {
                return
            }
            favourite.viewModule = FavModule(id: viewModule.id, img: viewModule.img_url, cost: viewModule.new_price, name: viewModule.title,manufacturer: viewModule.menufacturer)

            self.id = viewModule.id
            name.text = viewModule.title
            price.text = String(viewModule.new_price) + " ₸"
            price.sizeToFit()
            company.text = viewModule.menufacturer
            BuyButton.write = WriteProduct(id: viewModule.id, price: viewModule.new_price, name: viewModule.title, img: viewModule.img_url,manufacturer: viewModule.menufacturer)
            product_image.loadImageWithUrl(URL(string: viewModule.img_url)!)
            
        }
    }

    
    
    
 
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
