//
//  AdressTableViewFooterCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/12/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class AdressTableViewFooterCell: UITableViewCell {
    let button = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addview() {
        
        self.addSubview(button)
        button.snp.makeConstraints { (cons) in
            cons.left.right.top.bottom.equalTo(self).inset(13)
            cons.height.equalTo(44)
        }
        button.backgroundColor = .custom_green()
        button.setTitle("Добавить адрес", for: .normal)
        button.layer.cornerRadius = 7
        self.backgroundColor = .white
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
