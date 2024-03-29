//
//  ProdListTwoCollectionViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/6/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import RealmSwift
class ProdListTwoCollectionViewCell: UICollectionViewCell {
    let separtor = UIView()
    var main_view = ProductCellView()
    var line_view = UIView()

    var id : Int = 0 {
        didSet {
            main_view.favourite.check(id: id)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        main_view.name.text = nil
        main_view.price.text = nil
        main_view.company.text = nil
        main_view.BuyButton.id = nil
        main_view.product_image.image = nil
        main_view.BuyButton.write = nil
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(line_view)
        line_view.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(self)
        }
        line_view.backgroundColor = .gray
        addSubview(main_view)
        main_view.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(self)
            cons.left.right.top.bottom.equalTo(self).inset(0.3)
        }
        main_view.addview2()
    }
    
    var viewModule : ProductViewCellModuleType? {
        willSet(viewModule) {
            guard  let viewModule = viewModule else {
                return
            }
            
            self.id = viewModule.id
            main_view.favourite.viewModule = FavModule(id: viewModule.id, img: viewModule.img_url, cost: viewModule.new_price, name: viewModule.title,manufacturer: viewModule.menufacturer)
            main_view.name.text = viewModule.title
            main_view.price.text = String(viewModule.new_price) + " ₸"
            main_view.company.text = viewModule.menufacturer
            main_view.BuyButton.id = viewModule.id

            main_view.BuyButton.write = WriteProduct(id: viewModule.id, price: viewModule.new_price, name: viewModule.title, img: viewModule.img_url,manufacturer: viewModule.menufacturer)
            main_view.product_image.loadImageWithUrl(URL(string: viewModule.img_url)!)
            
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
