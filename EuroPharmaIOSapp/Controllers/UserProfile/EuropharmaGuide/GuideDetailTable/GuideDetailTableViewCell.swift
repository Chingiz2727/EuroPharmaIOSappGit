//
//  GuideDetailTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class GuideDetailTableViewCell: UITableViewCell {
    
    let icon = UIImageView()
    let title = UILabel()
    let descript = UILabel()
    var guide : EuroGuideModule? {
        didSet {
//            guard let item = guide else {return}
            icon.image = guide?.img ?? nil
            title.text = guide!.title ?? ""
            descript.text = guide!.text ?? ""
        }
    }
    
    lazy var stack = UIStackView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubViews(withList: [icon,stack])
        icon.contentMode = .scaleAspectFit
        descript.numberOfLines = 0
        stack.customStack(view: [title,descript], distribution: .fill, spacing: 2)
        title.get_bold(size: 14)
        descript.get_regular(size: 14)
        title.textColor = .custom_gray()
        descript.textColor = .custom_gray()
        stack.axis = .vertical
        icon.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(15)
            cons.width.height.equalTo(29)
            cons.top.equalTo(self).inset(18)
        }
        stack.snp.makeConstraints { (cons) in
            cons.top.bottom.right.equalTo(self).inset(18)
            cons.left.equalTo(icon.snp.right).offset(18)
        }
        stack.sizeToFit()
        stack.layoutIfNeeded()
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
