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
  let buy = UIButton()
    var sum_ofcost = [Int]()
    var total : Int = 0 {
        didSet {
            sum.text = String(total) + " тг"
        }
    }
    lazy var stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [title,sum])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 2
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(stack)
        stack.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(10)
            cons.top.bottom.equalTo(self).inset(5)
        }
        self.addSubview(buy)
        buy.snp.makeConstraints { (cons) in
            cons.right.equalTo(self).inset(15)
            cons.centerY.equalTo(self)
            
            cons.top.bottom.equalTo(stack).inset(10)
        }
        sum.font = UIFont.boldSystemFont(ofSize: 21)
        title.text = "Общая сумма"
        buy.setTitle("К оформлению", for: .normal)
        buy.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        buy.backgroundColor = #colorLiteral(red: 0.3484006822, green: 0.8703381419, blue: 0.338468194, alpha: 1)
        self.backgroundColor = .white
//        getcost()
        notify()
       total = results.reduce(0) {$0 + $1.cost*$1.count}
    }
    func getcost() {
        for item in results {
            sum_ofcost.append(item.cost*item.count)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func notify() {
        let results = try! Realm().objects(BasketModule.self)
        
        token = results.observe(  { [weak self] (changes:RealmCollectionChange) in
            switch changes {
            case.update(_, deletions: _, insertions:  _, modifications:  _):
                if results.count == 0 {
                    self?.total = 0
                }
               self?.total = results.reduce(0) {$0 + $1.cost*$1.count}
             print("objecssd")
            case .initial(_):
                print("init")
            case .error(let error):
                print(error)
            }
        })
    }
}
