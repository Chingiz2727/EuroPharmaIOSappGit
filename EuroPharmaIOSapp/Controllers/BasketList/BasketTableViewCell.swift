//
//  BasketTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
class BasketTableViewCell: UITableViewCell {
    let img : ImageLoader = ImageLoader()
    let desc : UILabel = UILabel()
    let price : UILabel = UILabel()
    let old_price : UILabel = UILabel()
    let remove : UIButton = UIButton()
    let count : UILabel = UILabel()
    let add : UIButton = UIButton()
    let delete : UIButton = UIButton()
    var remove_item : RemoveAtCell?
    var item = BasketModule() {
        didSet {
            desc.text = item.name
            price.text = String(item.cost) + " тг"
            count.text = String(item.count)
            Alamofire.request(item.img_url ?? "").responseJSON { (response) in
                if let data = response.data {
                    self.img.image = UIImage(data: data)
                }
            }
        }
    }
    
    lazy var count_stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [add,count,delete])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    @objc func remove_cell(sender:UIButton) {
        remove_item?.removeAtItem(item: sender.tag)
    }
    
    lazy var price_stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [price])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var full_stack : UIStackView = {
       let stack = UIStackView(arrangedSubviews: [desc])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addview() {
        self.addSubview(img)
        img.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(20)
            cons.width.equalTo(100)
            cons.height.equalTo(100)
            cons.centerY.equalTo(self)
            
        }
        self.addSubview(full_stack)
        full_stack.snp.makeConstraints { (cons) in
            cons.left.equalTo(img.snp.right).offset(15)
            cons.right.equalTo(self).inset(15)
            cons.top.equalTo(self).inset(15)
        }
        self.addSubview(price_stack)
        price_stack.snp.makeConstraints { (cons) in
            cons.left.equalTo(img.snp.right).offset(15)
            cons.top.equalTo(full_stack.snp.bottom).offset(15)
        }
        self.addSubview(count_stack)
        count_stack.snp.makeConstraints { (cons) in
            cons.height.equalTo(35)
            cons.top.equalTo(price_stack.snp.bottom).offset(15)
            cons.left.right.equalTo(price_stack).inset(0)
            cons.bottom.equalTo(self).inset(20)
        }
        
        self.addSubview(remove)
        remove.snp.makeConstraints { (cons) in
            cons.centerY.equalTo(count)
            cons.width.height.equalTo(24)
            cons.right.equalTo(self).inset(25)
        }
        remove.layer.cornerRadius = 12
        remove.setTitle("X", for: .normal)
        remove.setTitleColor(.red, for: .normal)
        remove.layer.borderWidth = 1
        remove.layer.borderColor = UIColor.red.cgColor
        remove.addTarget(self, action: #selector(remove_cell(sender:)), for: .touchUpInside)
        desc.numberOfLines = 0
        img.image = #imageLiteral(resourceName: "ab1768591e4ab2a9776dd743a1e4ec99")
        img.contentMode = .scaleAspectFit
        price.font = UIFont.boldSystemFont(ofSize: 22)
        price.text = "2 779"
        let text = "3268".strikeThrough()
        old_price.attributedText = text
        old_price.font = UIFont(name: "Arial", size: 17)
        old_price.textColor = .red
        desc.text = "Нестле каша молочная Овсяная М 220 гр 4"
        add.setTitle("+", for: .normal)
        delete.setTitle("-", for: .normal)
        delete.tag = 1
        add.tag = 0
        add.addTarget(self, action: #selector(add_and_remove(sender:)), for: .touchUpInside)
        delete.addTarget(self, action: #selector(add_and_remove(sender:)), for: .touchUpInside)
        count.text = "1"
        full_stack.sizeToFit()
        full_stack.layoutIfNeeded()
        old_price.textAlignment = .left
        price.textAlignment = .left
        add.layer.borderColor = UIColor.custom_gray().cgColor
        delete.layer.borderColor = UIColor.custom_gray().cgColor
        add.layer.borderWidth = 1
        delete.layer.borderWidth = 1
        add.setTitleColor(.custom_gray(), for: .normal)
        delete.setTitleColor(.custom_gray(), for: .normal)
        count.textAlignment = .center
        count.layer.borderWidth = 1
        count_stack.layer.borderColor = UIColor.custom_gray().cgColor
        full_stack.setCustomSpacing(UIStackView.spacingUseDefault, after: desc)
        self.selectionStyle = .none
    }
    
    @objc func add_and_remove(sender:UIButton) {
        
        switch sender.tag {
        case 0:
            item.count += 1
        default:
            if item.count != 1 {
                item.count -= 1
            }
        }
    
        
    }
    
}
