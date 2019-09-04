//
//  MakePaymentTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 9/3/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MakePaymentTableViewCell: UITableViewCell,ChangeCheckBox {
    func change() {
        if !checkBox.isChecked {
            print("checked")
        }
        else {
            print("unchked")
        }
    }
    

    let checkBox = Checkbox()
    let title = UILabel()
    let title_desc = UILabel()
    let comment = UILabel()
    lazy var stack = UIStackView()
    var module : PaymentModule? {
        willSet {
            title.text = module?.title
            title_desc.text = module?.sub_title
            comment.text = module?.descript
        }
    }
    
    
    
    func addview() {
        self.addSubview(checkBox)
        checkBox.borderStyle = .circle
        checkBox.checkmarkStyle = .circle
        checkBox.checkmarkColor = .custom_gray()
        checkBox.snp.makeConstraints { (cons) in
            cons.top.equalToSuperview().inset(15)
            cons.left.equalToSuperview().inset(15)
            cons.width.height.equalTo(20)
        }
        
        checkBox.checkedBorderColor = .custom_gray()
        checkBox.uncheckedBorderColor = .custom_gray()
        
        self.addSubview(stack)
        stack.customStack(view: [title,title_desc,comment], distribution: .fillProportionally, spacing: 4)
        stack.axis = .vertical
        stack.snp.makeConstraints { (cons) in
            cons.bottom.top.equalToSuperview().inset(12)
            cons.left.equalTo(checkBox.snp.right).offset(11)
            cons.right.equalToSuperview().inset(15)
        }
        checkBox.useHapticFeedback = true
        title_desc.numberOfLines = 0
        title.numberOfLines = 0
        comment.numberOfLines = 0
        title.get_regular(size: 16)
        title.textColor = .custom_gray()
        title_desc.textColor = .custom_gray_text()
        comment.textColor = .custom_gray()
        title_desc.get_regular(size: 14)
        comment.get_regular(size: 14)
        stack.sizeToFit()
        stack.layoutIfNeeded()
        checkBox.isUserInteractionEnabled = false
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addview()
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        if selected {
//                            checkBox.isChecked = true
//        } else {
//                            checkBox.isChecked = false
//            
//        }
    }

}

protocol ChangeCheckBox {
    func change()
}


