//
//  DetailBuyButton.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/20/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class DetailBuyButtonCount: UIView {
    var write : WriteProduct?
    var remove_at_cell : RemoveAtCell?
    @objc func add_product() {
        count += 1
        action?.count = count
        write?.write_count(count: count)
    }
    
    @objc func decrease_product() {
        
        if count != 0 {
            count -= 1
        }
        
        action?.count = count
        
        write?.write_count(count: count)
        if count == 0 {
            write?.remove()
            action?.remove()
            
            count = 1
            
        }
    }
    
    var action : BuyProductActions?
    
    var count: Int = 1 {
        didSet {
            title.text = "В корзине \(count) шт"
        }
    }
    
    
    
    let title = UILabel()
    let minusButton = UIButton()
    let plusButton = UIButton()
    
    func addView() {
        self.addSubview(minusButton)
        self.addSubview(plusButton)
        self.addSubview(title)
        self.backgroundColor = .custom_green()
        title.snp.makeConstraints { (cons) in
            cons.center.equalToSuperview()
        }
        title.get_bold(size: 18)
        title.textColor = .custom_gray()
        minusButton.snp.makeConstraints { (cons) in
            cons.top.left.bottom.equalToSuperview().inset(0)
            cons.width.equalTo(60)
        }
        plusButton.snp.makeConstraints { (cons) in
            cons.right.top.bottom.equalToSuperview().inset(0)
            cons.width.equalTo(60)
        }
        title.textColor = .white()
        plusButton.setTitle("+", for: .normal)
        minusButton.setTitle("-", for: .normal)
        title.text = "В корзину \(count) шт"
        plusButton.backgroundColor = #colorLiteral(red: 0.8392156863, green: 0.9215686275, blue: 0.5344825452, alpha: 1)
        minusButton.backgroundColor = #colorLiteral(red: 0.8392156863, green: 0.9215686275, blue: 0.5344825452, alpha: 1)
        plusButton.addTarget(self, action: #selector(add_product), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(decrease_product), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
