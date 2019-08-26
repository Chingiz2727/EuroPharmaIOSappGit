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
    let arrow = UIImageView()
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
        title_text.textColor = .custom_gray()
        title_text.get_regular(size: 17)
        self.backgroundColor = .white()
        arrow.contentMode = .scaleAspectFit
        img.snp.makeConstraints { (cons) in
            cons.left.equalTo(self).inset(20)
            cons.centerY.equalTo(self)
            cons.width.height.equalTo(25)
        }
        img.contentMode = .scaleAspectFit
        title_text.snp.makeConstraints { (cons) in
            cons.left.equalTo(img.snp.right).offset(20)
            cons.centerY.equalTo(self)
        }
        arrow.image = #imageLiteral(resourceName: "arrow")
        arrow.snp.makeConstraints { (cons) in
            cons.right.equalTo(self).inset(20)
            cons.centerY.equalTo(self)
            cons.height.equalTo(7)
            cons.width.equalTo(13)
        }
    }
    
    func getImage(name:String) -> UIImage {
        switch name {
        case "Лекарственные средства":
            return #imageLiteral(resourceName: "витамины3")
        case "Мать и дитя":
            return #imageLiteral(resourceName: "88")
        case "Красота и гигиена":
            return #imageLiteral(resourceName: "77")
        case "Витамины и бады":
            return #imageLiteral(resourceName: "99")
        case "Изделия мед. назначения":
            return #imageLiteral(resourceName: "10")
        default:
            return UIImage()
        }
        
    }
    var ViewModule : CategoryCellModuleType? {
        willSet(ViewModule) {
            guard let module = ViewModule else {return}
            img.image = getImage(name: module.title)
//            img.loadImageWithUrl(URL(string: module.img_url)!)
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
