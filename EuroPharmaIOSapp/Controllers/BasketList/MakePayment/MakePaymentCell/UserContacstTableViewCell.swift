//
//  UserContacstTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 9/4/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import TextFieldEffects

class UserContacstTableViewCell: UITableViewCell,UITextFieldDelegate {

    lazy var stack = UIStackView()
    let phone : TelephoneTextField = {
       let phone = TelephoneTextField()
        phone.borderInactiveColor = .gray
        phone.placeholder = "Мобильный телефон"
        return phone
    }()
    let name : HoshiTextField = {
       let name = HoshiTextField()
        name.borderInactiveColor = .gray
        name.placeholder = "Имя"
        return name
    }()
    
    func addview() {
        self.addSubview(stack)
        stack.customStack(view: [name,phone], distribution: .fillEqually, spacing: 5)
        stack.axis = .vertical
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalToSuperview().inset(15)
            cons.top.bottom.equalToSuperview().inset(10)
        }
        phone.snp.makeConstraints { (cons) in
            cons.height.equalTo(55)
        }
        name.snp.makeConstraints { (cons) in
            cons.height.equalTo(55)
        }
        phone.delegate = self

        self.selectionStyle = .none
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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let phoneTextField = textField as? TelephoneTextField else { return }
        phoneTextField.textFieldDidBeginEditing()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let telephoneTextField = textField as? TelephoneTextField else { return true }
        return telephoneTextField.checkTelephoneNumber(textField, shouldChangeCharactersIn: range, replacementString: string)
    }

}
