//
//  MyOrdersOrdersTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MyOrdersOrdersTableViewCell: UITableViewCell {
    let img = ImageLoader()
    let title : UILabel = {
       let title = UILabel()
        title.get_regular(size: 17)
        title.textColor = .custom_gray()
        title.numberOfLines = 0
        title.text = "Магне В6 Премиум №30, табл., покрытые оболочкой"
        return title
    }()
    
    let company : UILabel = {
    let comp = UILabel()
        comp.text = "Санофи-Авентис"
        comp.textColor = .gray
        comp.get_regular(size: 15)
        comp.numberOfLines = 1
        return comp
    }()
    
    let price_text : UILabel = {
       let text = UILabel()
        text.textColor = .gray
        text.get_regular(size: 14)
        text.text = "Цена"
        return text
    }()
    
    let count_text : UILabel = {
        let text = UILabel()
        text.textColor = .gray
        text.get_regular(size: 14)
        text.text = "Кол.во"
        return text
    }()
    
    let sum_text : UILabel = {
        let text = UILabel()
        text.textColor = .gray
        text.get_regular(size: 14)
        text.text = "Сумма"
        return text
    }()
    
    let price : UILabel = {
        let text = UILabel()
        text.textColor = .custom_gray()
        text.get_regular(size: 14)
        text.text = "2 308" + tg_sign
        return text
    }()
    let count : UILabel = {
        let text = UILabel()
        text.textColor = .custom_gray()
        text.get_regular(size: 14)
        text.text = "2"
        return text
    }()
    
    let sum : UILabel = {
        let text = UILabel()
        text.textColor = .custom_gray()
        text.get_regular(size: 14)
        text.text = "4 616" + tg_sign
        return text
    }()
    
    
    lazy var price_stack = UIStackView()
    lazy var count_stack = UIStackView()
    lazy var sum_stack = UIStackView()
    lazy var bot_stack = UIStackView()
    lazy var full_stack = UIStackView()
    
    
    func addview() {
        price_stack.customStack(view: [price_text,price], distribution: .fill, spacing: 4)
        price_stack.axis = .vertical
        count_stack.customStack(view: [count_text,count], distribution: .fill, spacing: 4)
        count_stack.axis = .vertical
        sum_stack.customStack(view: [sum_text,sum], distribution: .fill, spacing: 4)
        sum_stack.axis = .vertical
        bot_stack.customStack(view: [price_stack,count_stack,sum_stack], distribution: .fillEqually, spacing: 4)
        bot_stack.axis = .horizontal
        full_stack.customStack(view: [title,company,bot_stack], distribution: .fillProportionally, spacing: 5)
        full_stack.axis = .vertical
        self.addSubview(img)
        img.snp.makeConstraints { (cons) in
         cons.centerY.equalTo(self)
            cons.left.equalTo(self).inset(20)
            cons.width.equalTo(130)
            cons.height.equalTo(100)
        }
        self.addSubview(full_stack)
        full_stack.snp.makeConstraints { (cons) in
            cons.top.bottom.equalToSuperview().inset(10)
            cons.right.equalToSuperview().inset(20)
            cons.left.equalTo(img.snp.right).offset(10)
        }
        full_stack.sizeToFit()
        full_stack.layoutIfNeeded()
        self.selectionStyle = .none
        img.image = #imageLiteral(resourceName: "ab1768591e4ab2a9776dd743a1e4ec99")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
