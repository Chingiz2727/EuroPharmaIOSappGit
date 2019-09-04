//
//  WriteProductToBasket.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/6/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import RealmSwift

class WriteProduct {
    var id : Int
    var price : Int
    var name : String
    var img : String
    var count : Int
    var manufacturer : String
    var Basket_list = [BasketModule]()
    var Basket = BasketModule()

    init(id:Int,price:Int,name:String,img:String,manufacturer:String) {
        self.id = id
        self.price = price
        self.name = name
        self.img = img
        self.manufacturer = manufacturer
        count = 1
    }
    var tag : Int?
    let realm = try? Realm()
    var remoatcell : RemoveAtCell?
    func appenData() {
        if Basket.isInvalidated == true {
            
           let new_Basket = BasketModule()
            new_Basket.id = id
            new_Basket.count = count
            new_Basket.cost = price
            new_Basket.name = name
            new_Basket.img_url = img
            var list =  [BasketModule]()
            list.append(new_Basket)
            Basket = new_Basket
            Basket_list = list

            try? realm?.write {
                realm?.add(list)
            }
            
        }
        else {
            Basket.id = id
            Basket.count = count
            Basket.cost = price
            Basket.name = name
            Basket.img_url = img
            Basket_list.append(Basket)
            do {
                try realm?.write {
                    realm?.add(Basket_list)
                }
            }
            catch let error as NSError {
                print(error)
            }
        }
        
    }
    
    func write_count(count:Int) {
        print(Basket.isInvalidated)
        if Basket.isInvalidated == true {
            
            let new_Basket = BasketModule()
            new_Basket.id = id
            new_Basket.count = count
            new_Basket.cost = price
            new_Basket.name = name
            new_Basket.img_url = img
            var list =  [BasketModule]()
            list.append(new_Basket)
            Basket = new_Basket
            Basket_list = list
            
            try? realm?.write {
                realm?.add(list)
            }
            
        }
        else {
            do {
                try realm?.write {
                    Basket.count = count
                }
            }
            catch let error as NSError {
                print(error)
            }
        }
   
        
    }
    
    func remove() {
        let realm = try? Realm()
        try? realm?.write {
            realm?.delete(Basket_list)
        }
        guard let tag = tag else {return}
        remoatcell?.removeAtItem(item: tag)
    }
    
    
    
}









class InitBuy : UIView,BuyProductActions {
    var count: Int = 1 {
        didSet {
            write?.write_count(count: count)
        }
    }
    
    func remove() {
        count_button.removeFromSuperview()
        addBuyButton()
        write?.remove()
    }
    
    
    let count_button = BuyProductsButton()
    let buy_button : UIButton = {
    let button = UIButton()
        button.setTitle("Купить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .custom_green()
        button.layer.cornerRadius = 3
        button.titleLabel?.get_regular(size: 16)
        button.addTarget(self, action: #selector(add_count), for: .touchUpInside)
        return button
        
    }()
    
    var id : Int?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addview()
        count_button.action = self
        count_button.write = write
    }
    
    func addview() {
        let res = try! Realm().objects(BasketModule.self)
        if res.contains(where: {($0.id == write?.id)}) {
            add_countButton()
            for i in res {
                count_button.count = i.count
                write?.Basket = i
            }
        }
            
        else {
            addBuyButton()
        }
    }
    
    var write : WriteProduct?

    func add_countButton() {
       
        self.addSubview(count_button)
        count_button.snp.makeConstraints { (cons) in
            cons.top.left.right.bottom.equalTo(self).inset(0)
        }
        count_button.write = write
        write?.appenData()
    }
    
    @objc func add_count() {
        self.addSubview(count_button)
        count_button.snp.makeConstraints { (cons) in
            cons.top.left.right.bottom.equalTo(self).inset(0)
        }
        write?.appenData()
        buy_button.removeFromSuperview()

    }
    
    
    func addBuyButton() {
        
        self.addSubview(buy_button)
        
        buy_button.snp.makeConstraints { (cons) in
            cons.width.height.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
