//
//  MedicineDetailHeaderTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/6/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MedicineDetailHeaderTableViewCell: UITableViewCell,ChangeItems {
    func change() {
        title.setImage(#imageLiteral(resourceName: "arrow-up"), for: .normal)
        name.get_bold(size: 16)
        
    }
    
    let title : UIButton = UIButton()
    let name : UILabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(name)
     
        name.layoutIfNeeded()
        name.numberOfLines = 0
        self.addSubview(title)
        title.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(20)
            cons.right.equalTo(self).inset(20)
            cons.centerY.equalTo(self)
        }
        
        name.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(10)
            cons.right.equalTo(title.snp.left).offset(-10)
            cons.top.bottom.equalTo(self).inset(10)
            cons.centerY.equalTo(self)
        }
        
        self.backgroundColor = .white
        title.setImage(#imageLiteral(resourceName: "Vector-8"), for: .normal)
        title.imageView?.contentMode = .scaleAspectFit
        name.get_regular(size: 16)
        getcolor()
    }
    

   
    func getcolor() {
        self.backgroundColor = .white()
        title.setTitleColor(.custom_gray(), for: .normal)
        name.textColor = .custom_gray()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
protocol ChangeItems {
    func change()
}
