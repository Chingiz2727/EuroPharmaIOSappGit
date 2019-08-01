//
//  MedicineDetailView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/17/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MedicineDetailView: UIView {
    let img  = ImageLoader()
    let title : UILabel = UILabel()
    let price : UILabel = UILabel()
    let old_price : UILabel = UILabel()
    let detail : UILabel = UILabel()
    let type : UILabel = UILabel()
    let company : UILabel = UILabel()
    let country : UILabel = UILabel()
    let scroll : UIScrollView = UIScrollView()
    let add : UIButton = UIButton()
    let remove : UIButton = UIButton()
    let count : UILabel = UILabel()
    
    let buy : UIButton = UIButton()
    
     var product : CategoryContentModel? {
        willSet(product) {
            guard let prod = product else { return}
            title.text = prod.title
            price.text = String(prod.new_price ?? 0)
            old_price.attributedText = String(prod.old_price ?? 0).strikeThrough()
            detail.text = prod.title
            img.loadImageWithUrl(URL(string: prod.img_url ?? "")!)
            
        }
    }
    
    lazy var main_stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [img,title,price,old_price,detail])
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var detail_stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [type,company,country])
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var count_stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [add,count,remove])
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    func addview() {
        self.addSubview(scroll)
        scroll.addSubview(main_stack)
        img.contentMode = .scaleAspectFit
        main_stack.snp.makeConstraints { (cons) in
            cons.top.equalTo(scroll).inset(5)
            cons.left.right.equalTo(self).inset(5)
        }
        img.snp.makeConstraints { (cons) in
            cons.height.equalTo(200)
        }
        scroll.addSubview(detail_stack)
        detail_stack.snp.makeConstraints { (cons) in
            cons.top.equalTo(detail.snp.bottom).offset(15)
            cons.height.equalTo(40)
            cons.left.right.equalTo(self).inset(15)
        }
        scroll.addSubview(count_stack)
        count_stack.snp.makeConstraints { (cons) in
            cons.top.equalTo(type.snp.bottom).offset(30)
            cons.left.equalTo(self).inset(15)
        }
        add.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(40)
        }
        remove.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(40)
        }
        add.tag = 0
        remove.tag = 1
        scroll.addSubview(buy)
        buy.snp.makeConstraints { (cons) in
            cons.top.equalTo(type.snp.bottom).offset(30)
            cons.right.equalTo(self).inset(15)
            cons.left.equalTo(remove.snp.right).offset(30)
            cons.height.equalTo(50)
            cons.bottom.equalTo(scroll.snp.bottom).offset(-120)
        }
        scroll.snp.makeConstraints { (cons) in
            cons.left.right.top.bottom.equalTo(self).inset(0)
        }
        main_stack.layoutIfNeeded()
        main_stack.sizeToFit()
        count_stack.layoutIfNeeded()
        count_stack.sizeToFit()
        
        
        
    }
    var count_text : Int = 1 {
        didSet {
            count.text = String(count_text)
            
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        detail.numberOfLines = 0
       addview()
        add.addTarget(self, action: #selector(add_and_remove(sender:)), for: .touchUpInside)
        remove.addTarget(self, action: #selector(add_and_remove(sender:)), for: .touchUpInside)
        self.backgroundColor = .white
       
        
    }

    @objc func add_and_remove(sender:UIButton) {
       
        switch sender.tag {
        case 0:
            count_text += 1
        default:
            if count_text != 1 {
                count_text -= 1
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addstyle() {
        img.contentMode = .scaleAspectFit
        title.font = UIFont(name: "Arial", size: 18)
        price.font = UIFont.boldSystemFont(ofSize: 21)
        old_price.font = UIFont.init(name: "Arial", size: 18)
        old_price.textColor = .red
        detail.font = UIFont(name: "Arial", size: 18)
        type.layer.cornerRadius = 15
        type.layer.borderColor = UIColor.custom_green().cgColor
        type.layer.borderWidth = 1
        country.layer.cornerRadius = 15
        country.layer.borderColor = UIColor.custom_green().cgColor
        country.layer.borderWidth = 1
        company.layer.cornerRadius = 15
        title.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        company.layer.borderColor = UIColor.custom_green().cgColor
        company.layer.borderWidth = 1
        count.font = UIFont(name: "Arial", size: 22)
        buy.backgroundColor = .custom_green()
        add.setTitle("+", for: .normal)
        remove.setTitle("-", for: .normal)
        buy.setTitle("В корзину", for: .normal)
        add.layer.borderWidth = 1
        remove.layer.borderWidth = 1
        add.layer.cornerRadius = 20
        remove.layer.cornerRadius = 20
        add.layer.borderColor = UIColor.custom_green().cgColor
        remove.layer.borderColor = UIColor.custom_green().cgColor
        count.text = "1"
        country.textAlignment = .center
        type.textAlignment = .center
        company.textAlignment = .center
        count.textAlignment = .center
        add.backgroundColor = .custom_green()
        remove.backgroundColor = .custom_green()
    }

}
