//
//  BasketTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
class BasketTableViewCell: UITableViewCell {
    let img : ImageLoader = ImageLoader()
    let desc : UILabel = UILabel()
    let price : UILabel = UILabel()
    var remove_item : RemoveAtCell?
    var item : BasketModule? {
        willSet(item) {
            desc.text = item?.name
            price.text = String(item?.cost ?? 0) + " ₸"
            buy.count = item?.count ?? 0
        
        }
        
    }
    let manufacturer : UILabel = UILabel()
    var viewModule : ProductViewCellModuleType? {
        willSet(viewModule) {
        
            fav.viewModule = viewModule
//            self.id = viewModule.id
            
            desc.text = viewModule?.title
            price.text = String(viewModule?.new_price ?? 0) + " ₸"
            buy.write = WriteProduct(id: viewModule?.id ?? 0, price: viewModule?.new_price ?? 0, name: viewModule?.title ?? "", img: viewModule?.img_url ?? "", manufacturer: viewModule?.menufacturer ?? "")
            img.loadImageWithUrl(URL(string: viewModule?.img_url ?? "")!)
            
        }
    }
    

    @objc func remove_cell(sender:UIButton) {
        remove_item?.removeAtItem(item: sender.tag)
    }
    
    lazy var price_stack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [price])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var full_stack : UIStackView = {
       let stack = UIStackView(arrangedSubviews: [desc,manufacturer,price])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        guard let it = item else {return}
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addview()
        guard let it = item else {return}
        buy.write = WriteProduct(id: it.id, price: it.cost, name: it.name, img: it.img_url ?? "", manufacturer: it.manufacturer ?? "")
        buy.count = it.count
        print(it)
        self.backgroundColor = .white
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let fav = FavouriteView()
    let buy = BuyProductsButton()
    func addview() {
        desc.numberOfLines = 2
      self.addSubview(img)
       
        desc.textColor = .custom_gray()
        price.textColor = .custom_gray()
        self.addSubview(full_stack)
        self.addSubview(fav)
        self.addSubview(buy)
        fav.snp.makeConstraints { (cons) in
            cons.top.right.equalTo(self).inset(10)
            cons.width.height.equalTo(30)
        }
        img.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(15)
            cons.bottom.equalTo(self).inset(15)
            cons.left.equalTo(self).inset(10)
            cons.width.equalTo(130)
            
        }
        img.contentMode = .scaleAspectFit
      
        full_stack.snp.makeConstraints { (cons) in
            cons.top.bottom.equalTo(self).inset(10)
            cons.left.equalTo(img.snp.right).offset(10)
            cons.right.equalTo(fav.snp.left).offset(-10)
        }
        buy.snp.makeConstraints { (cons) in
            cons.right.equalTo(self).inset(10)
            cons.centerY.equalTo(price)
            cons.width.equalTo(100)
            cons.height.equalTo(35)
        }
    }
    

    
}
