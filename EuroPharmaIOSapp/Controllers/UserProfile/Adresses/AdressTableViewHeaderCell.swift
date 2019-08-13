//
//  AdressTableViewHeaderCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/12/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class AdressTableViewHeaderCell: UITableViewCell {

    let name = UILabel()
    let city = UILabel()
    lazy var stack = UIStackView()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addview() {
        self.addSubview(stack)
        self.backgroundColor = .white
        stack.customStack(view: [city,name], distribution: .fill, spacing: 5)
        stack.axis = .horizontal
        stack.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(10)
            cons.top.bottom.equalTo(self).inset(5)
        }
        name.numberOfLines = 0
        city.text = "Город"
        name.text = "Адрес"
        city.get_bold(size: 18)
        name.get_bold(size: 18)
        name.textAlignment = .left
        city.textAlignment = .left
        name.numberOfLines = 0
        stack.sizeToFit()
        stack.layoutIfNeeded()
    }


}
