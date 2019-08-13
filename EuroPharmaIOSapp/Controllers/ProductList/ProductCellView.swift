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
   
    
    
    
    var id : Int = 0 {
        didSet {
            favourite.check(id: id)
        }
    }
    
    func addview2(){
        product_image.contentMode = .scaleAspectFit
        addSubview(product_image)
        addSubview(favourite)
        favourite.snp.makeConstraints { (cons) in
            cons.top.right.equalToSuperview().inset(10)
            cons.width.height.equalTo(30)
        }
        product_image.snp.makeConstraints { (cons) in
            cons.top.equalTo(favourite.snp.bottom).offset(5)
            cons.left.right.equalTo(self).inset(10)
            cons.height.equalTo(101)
        }
        
        name.numberOfLines = 2
        
       
        
        
        price.textColor = .custom_gray()
        
        name.get_regular(size: 16)
        company.get_regular(size: 16)
        company.textColor = .custom_gray_text()
        price.get_bold(size: 18)
        
        stack.customStack(view: [name,company], distribution: .fill, spacing: 3)
        stack.axis = .vertical
        addSubview(stack)
        self.addSubview(price)
       
        self.addSubview(BuyButton)
        
     
        stack.snp.makeConstraints { (cons) in
            cons.top.equalTo(product_image.snp.bottom).offset(5)
            cons.left.right.equalTo(self).inset(10)
            //            cons.right.equalTo(like_button.snp.left).offset(5)
        }
        price.snp.makeConstraints { (cons) in
            cons.top.equalTo(stack.snp.bottom).offset(3)
            cons.left.equalTo(self).inset(10)
            cons.right.equalTo(BuyButton.snp.left).offset(5)
        }
        BuyButton.snp.makeConstraints { (cons) in
            cons.right.equalTo(self).inset(3)
            cons.centerY.equalTo(price)
            cons.height.equalTo(40)
            cons.width.equalTo(100)
            cons.left.equalTo(price.snp.right).offset(10)
        }
        self.backgroundColor = .white
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
        addSubview(favourite)
        favourite.snp.makeConstraints { (cons) in
            cons.top.right.equalToSuperview().inset(5)
            cons.width.height.equalTo(30)
        }
        
        
        
        price.textColor = .custom_gray()
        
        name.get_regular(size: 16)
        company.get_regular(size: 16)
        company.textColor = .custom_gray_text()
        price.get_bold(size: 18)
        
        stack.customStack(view: [name,company], distribution: .fill, spacing: 3)
        stack.axis = .vertical
        addSubview(stack)
        self.addSubview(price)
        
        stack.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(15)
            cons.left.equalTo(product_image.snp.right).offset(15)
            cons.right.equalTo(favourite.snp.left).offset(5)
        }
        price.snp.makeConstraints { (cons) in
            cons.top.equalTo(stack.snp.bottom).offset(3)
            cons.left.equalTo(product_image.snp.right).offset(15)
            
        }
        
        self.addSubview(BuyButton)
        
        BuyButton.snp.makeConstraints { (cons) in
            cons.left.equalTo(price.snp.right).offset(20)
            cons.right.equalTo(self).inset(20)
            cons.height.equalTo(40)
            cons.width.equalTo(100)
            cons.centerY.equalTo(price)
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
        
        
    }
    
    var viewModule : ProductViewCellModuleType? {
        willSet(viewModule) {
            guard  let viewModule = viewModule else {
                return
            }
            favourite.viewModule = viewModule

            self.id = viewModule.id
            name.text = viewModule.title
            price.text = String(viewModule.new_price) + " ₸"
            company.text = viewModule.menufacturer
            BuyButton.write = WriteProduct(id: viewModule.id, price: viewModule.new_price, name: viewModule.title, img: viewModule.img_url,manufacturer: viewModule.menufacturer)
            product_image.loadImageWithUrl(URL(string: viewModule.img_url)!)
            
        }
    }

    
    
    
 
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
