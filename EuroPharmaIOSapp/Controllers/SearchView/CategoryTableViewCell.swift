//
//  CategoryTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/2/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    let img : ImageLoader = ImageLoader()
    let title_text = UILabel()
    let arrow = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addview() {
        self.addSubview(img)
        self.addSubview(title_text)
        self.addSubview(arrow)
        arrow.text = ">"
        img.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(20)
            cons.centerY.equalTo(self)
            cons.width.height.equalTo(35)
        }
        title_text.snp.makeConstraints { (cons) in
            cons.left.equalTo(img.snp.right).offset(20)
            cons.centerY.equalTo(self)
        }
        arrow.snp.makeConstraints { (cons) in
            cons.right.equalTo(self).inset(10)
            cons.centerY.equalTo(self)
        }
    }
    var ViewModule : CategoryCellModuleType? {
        willSet(ViewModule) {
            guard let module = ViewModule else {return}
            img.loadImageWithUrl(URL(string: module.img_url)!)
            title_text.text = module.title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
