//
//  DepartMentHeadTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/13/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class DepartMentHeadTableViewCell: UITableViewCell {
    let city = UILabel()
    let arrow = UIImageView()
    
    func addview() {
        city.text = "Алматы"
        city.get_regular(size: 20)
        city.textColor = .custom_gray()
        self.addSubview(city)
        city.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(20)
            cons.top.bottom.equalTo(self).inset(20)
        }
        self.addSubview(arrow)
        arrow.contentMode = .scaleAspectFit
        arrow.image = #imageLiteral(resourceName: "arrow")
        arrow.snp.makeConstraints { (cons) in
            cons.right.equalTo(self).inset(20)
            cons.centerY.equalTo(self)
            cons.width.height.equalTo(21)
        }
        self.backgroundColor = .white
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

    }

}
