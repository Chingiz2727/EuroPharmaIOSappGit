//
//  MakeOrderButtonView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift

class MakeOrderButtonView: UIView {
    let results = try! Realm().objects(BasketModule.self)
    var token: NotificationToken? = nil

  let title = UILabel()
  let sum = UILabel()
 let total_sum = UILabel()
    let total_sum_text = UILabel()

  let discount = UILabel()
  let discount_sum = UILabel()
  let total_label = UILabel()
    var total_count : String?  {
        didSet {
            total_sum.text = String(total_count ?? "0")
        }
    }
    var total : Double = 0 {
        didSet {
            total_label.text = "Итого без доставки: " + String(Int(Int(total) - Int(total*0.05))) + tg_sign
            discount_sum.text = String(Int(total*0.05)) + tg_sign
            sum.text =  String(Int(total)) + tg_sign
        }
    }
    lazy var stack0 : UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [total_sum_text,total_sum])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 10
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [title,sum])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 10
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    lazy var stack2 : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [discount,discount_sum])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 10
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stack0)
        self.addSubview(stack)
        self.addSubview(stack2)
        self.addSubview(total_label)
        total_sum_text.text = "Товаров в заказе"
        stack0.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(16)
            cons.top.equalTo(self).inset(5)
        }
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(16)
            cons.top.equalTo(stack0.snp.bottom).offset(5)
        }
        stack2.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(16)
            cons.top.equalTo(stack.snp.bottom).offset(5)
        }
        total_label.snp.makeConstraints { (cons) in
            cons.top.equalTo(stack2.snp.bottom).offset(12)
            cons.left.right.equalTo(self).inset(16)
            cons.bottom.equalTo(self).inset(10)
        }
        total_sum_text.get_regular(size: 15)
        total_sum_text.textColor = .custom_gray()
        total_sum.get_regular(size: 15)
        total_sum.textColor = .custom_gray()
        sum.get_regular(size: 15)
        title.get_regular(size: 15)
        discount.get_regular(size: 15)
        discount_sum.get_regular(size: 15)
        total_label.get_bold(size: 16)
        title.text = "Стоимость"
        discount.text = "Скидка"
        discount.textColor = .custom_gray()
        total_label.textColor = .custom_gray()
        sum.textColor = .custom_gray()
        title.textColor = .custom_gray()
        discount.textColor = .custom_gray()
        discount_sum.textColor = .custom_gray()
        
        self.backgroundColor = .white()
        notify()
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func notify() {
        let results = try! Realm().objects(BasketModule.self)
        total = Double(results.reduce(0) {$0 + $1.cost*$1.count})
        total_count = String(results.reduce(0) {$0 + $1.count})
        token = results.observe(  { [weak self] (changes:RealmCollectionChange) in
            switch changes {
            case.update(_, deletions: _, insertions:  _, modifications:  _):
                if results.count == 0 {
                    self?.total = 0
                }
                self?.total = Double(results.reduce(0) {$0 + $1.cost*$1.count})
            case .initial(_):
                break
            case .error(let error):
                print(error)
            }
        })
    }
}
