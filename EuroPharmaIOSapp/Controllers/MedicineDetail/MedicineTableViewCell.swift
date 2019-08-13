//
//  MedicineTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/6/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
import SDWebImage
import Alamofire
class MedicineTableViewCell: UITableViewCell {
  

    let img = ImageLoader()
    let name = UILabel()
    let contains = UILabel()
    let containt_status = UILabel()
    let like_button = UIButton()
    let line = UIView()
    let price = UILabel()
    let buy_button = UIButton()
    
    lazy var detail_stack = UIStackView()
    lazy var contains_stack = UIStackView()
    lazy var main_stack = UIStackView()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func addview() {
        
        name.get_regular(size: 20)
        name.textColor = .custom_gray()
        name.numberOfLines = 2
        containt_status.get_regular(size: 18)
        containt_status.textColor = .custom_green()
        contains.get_regular(size: 18)
        contains.get_regular(size: 18)
        img.contentMode = .scaleAspectFit
        price.get_bold(size: 20)
        price.textColor = .custom_gray()
        buy_button.backgroundColor = .custom_green()
        buy_button.setTitle("Добавить в корзину", for: .normal)
        buy_button.setTitleColor(.white, for: .normal)
        addSubview(main_stack)
        self.selectionStyle = .none
      
        detail_stack.customStack(view: [name,like_button], distribution: .fill, spacing: 10)
        contains_stack.customStack(view: [contains,containt_status], distribution: .fill, spacing: 10)
        detail_stack.sizeToFit()
        detail_stack.layoutIfNeeded()
        contains_stack.axis = .horizontal
        detail_stack.axis = .horizontal
        main_stack.customStack(view: [img,detail_stack,contains_stack,line,price,buy_button], distribution: .fill, spacing: 10)
        main_stack.axis = .vertical
        main_stack.snp.makeConstraints { (cons) in
            cons.left.right.top.bottom.equalTo(self).inset(10)
        }
        main_stack.sizeToFit()
        main_stack.layoutIfNeeded()
        line.snp.makeConstraints { (cons) in
            cons.height.equalTo(0.3)
        }
        line.backgroundColor = .custom_gray()
        like_button.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(40)
        }
        buy_button.snp.makeConstraints { (cons) in
            cons.height.equalTo(55)
        }
        
      like_button.setImage(#imageLiteral(resourceName: "Vector-2"), for: .normal)
        contains.text = "Наличие"
        containt_status.text = "Есть в наличии"
        containt_status.textAlignment = .right
        contains.textAlignment = .left
        detail_stack.snp.makeConstraints { (cons) in
            cons.height.equalTo(80)
        }
        buy_button.layer.cornerRadius = 5
        
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addview()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        img.image = UIImage()
        
        name.text = nil
        price.text = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var Basket_list = [BasketModule]()


    
  
    var product : ProductElement? {
        willSet(product) {
        guard let product = product , let url = product.img else  { return
        }
   
           
            img.loadImageWithUrl(URL(string: url)!)
            name.text = product.name
            price.text = String(product.price ?? 0) + tg_sign
        
        }
 
    }

}
