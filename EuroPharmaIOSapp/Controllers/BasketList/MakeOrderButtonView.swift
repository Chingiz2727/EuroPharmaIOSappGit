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
  let discount = UILabel()
  let discount_sum = UILabel()
  let total_label = UILabel()
    var total : Double = 0 {
        didSet {
            total_label.text = "Итого: " + String(Int(Int(total) - Int(total*0.05))) + tg_sign
            discount_sum.text = String(Int(total*0.05)) + tg_sign
            sum.text =  String(Int(total)) + tg_sign
        }
    }
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
        self.addSubview(stack)
        self.addSubview(stack2)
        self.addSubview(total_label)
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(10)
            cons.top.equalTo(self).inset(5)
        }
        stack2.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(10)
            cons.top.equalTo(stack.snp.bottom).offset(10)
        }
        total_label.snp.makeConstraints { (cons) in
            cons.top.equalTo(stack2.snp.bottom).offset(10)
            cons.left.right.equalTo(self).inset(10)
            cons.bottom.equalTo(self).inset(10)
        }
       
        sum.get_regular(size: 18)
        title.get_regular(size: 18)
        discount.get_regular(size: 18)
        discount_sum.get_regular(size: 18)
        total_label.get_bold(size: 22)
        title.text = "Стоимость"
        discount.text = "Скидка"
        discount.textColor = .custom_gray()
        total_label.textColor = .custom_gray()
        sum.textColor = .custom_gray()
        title.textColor = .custom_gray()
        discount.textColor = .custom_gray()
        discount_sum.textColor = .custom_gray()
        
        self.backgroundColor = .white
//        getcost()
        notify()
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func notify() {
        let results = try! Realm().objects(BasketModule.self)
        total = Double(results.reduce(0) {$0 + $1.cost*$1.count})

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
