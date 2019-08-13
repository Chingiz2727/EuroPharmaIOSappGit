//
//  MedicineDetailHeaderTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/6/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MedicineDetailHeaderTableViewCell: UITableViewCell {
    let title : UIButton = UIButton()
    let name : UILabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(name)
        name.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(10)
            cons.centerY.equalTo(self)
        }
        self.addSubview(title)
        title.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(20)
            cons.right.equalTo(self).inset(20)
            cons.centerY.equalTo(self)
            
        }
        self.backgroundColor = .white
        title.setImage(#imageLiteral(resourceName: "Vector-8"), for: .normal)
        title.imageView?.contentMode = .scaleAspectFit
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
