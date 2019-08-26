//
//  InitDetailBuyButton.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/20/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class InitDetailBuyButton: UIView,BuyProductActions {
    var count: Int  = 1 {
        didSet {
            write?.write_count(count: count)
        }
    }
    var write : WriteProduct?

    func remove() {
        count_button.removeFromSuperview()
        addBuy()
        
    }
    
    let count_button = DetailBuyButtonCount()
    let buy_button = UIButton()
    
    func addcount() {
        buy_button.removeFromSuperview()
        self.addSubview(count_button)
        count_button.write = write
        write?.appenData()

        count_button.snp.makeConstraints { (cons) in
            cons.edges.equalToSuperview()
        }
    }
    
    
    func addBuy() {
        self.addSubview(buy_button)
        buy_button.addTarget(self, action: #selector(addcounting), for: .touchUpInside)
        buy_button.snp.makeConstraints { (cons) in
            cons.edges.equalToSuperview()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBuy()
        buy_button.setTitle("Добавить в корзину", for: .normal)
        count_button.action = self
        count_button.write = write
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addcounting() {
        addcount()
    }
    
    
}
