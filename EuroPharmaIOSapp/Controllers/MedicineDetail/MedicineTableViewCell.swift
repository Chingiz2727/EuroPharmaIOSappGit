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
    let like_button : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(like), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        button.setImage(#imageLiteral(resourceName: "Vector-2"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    @objc func like() {
        
        if (like_button.imageView?.image == UIImage(named: "333")) {
            
            remove_fav()
        } else
        {
            
            add_toFav()
        }
        
    }
    var viewModule : ProductViewCellModuleType?
    
    @objc func remove_fav() {
        
        let realm = try? Realm()
        let results = try! Realm().objects(FavouritesModule.self)
        for i in results {
            if i.id == product!.id {
                try? realm?.write {
                    realm?.delete(i)
                    like_button.setImage(UIImage(named: "Vector-5"), for: .normal)
                    
                }
            }
        }
        
    }
    func check(id:Int)
    {
        let results = try! Realm().objects(FavouritesModule.self)
        if results.contains(where: {($0.id == id)}) {
            self.like_button.setImage(#imageLiteral(resourceName: "333"), for: .normal)
        }
        else {
            self.like_button.setImage(#imageLiteral(resourceName: "Vector-5"), for: .normal)
        }
    }
    
    func add_toFav() {
        
        let realm = try? Realm()
        let fav = FavouritesModule()
        var fav_list = [FavouritesModule]()
        fav.id = product?.id ?? 0
        fav.cost = product?.price ?? 0
        fav.img_url = product?.img ?? ""
        fav.name = product?.name ?? ""
        fav_list.append(fav)
        try? realm?.write {
            realm?.add(fav_list)
            like_button.setImage(UIImage(named: "333"), for: .normal)
            
        }
    }
    let img_back_view = UIView()
    
    let line = UIView()
    let price = UILabel()
    let buy_button = InitDetailBuyButton()
    
    lazy var detail_stack = UIStackView()
    lazy var contains_stack = UIStackView()
    lazy var main_stack = UIStackView()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func addview() {
        name.get_regular(size: 17)
        name.textColor = .custom_gray()
        name.numberOfLines = 2
        containt_status.get_regular(size: 15)
        containt_status.textColor = .custom_green()
        contains.get_regular(size: 15)
        img.contentMode = .scaleAspectFit
        price.get_bold(size: 17)
        price.textColor = .custom_gray()
        buy_button.backgroundColor = .custom_green()
        line.backgroundColor = .gray
        buy_button.buy_button.titleLabel?.get_regular(size: 16)
        if let viewModule = viewModule {
        buy_button.write = WriteProduct(id: viewModule.id, price: viewModule.new_price, name: viewModule.title, img: viewModule.img_url, manufacturer: viewModule.menufacturer)
            print("data appended")
        }
        
        addSubViews(withList: [img,name,like_button,contains,containt_status,line,price,buy_button])
        img.snp.makeConstraints { (cons) in
            cons.top.equalToSuperview().inset(10)
            cons.height.equalTo(183)
            cons.left.right.equalToSuperview().inset(60)
        }
        name.snp.makeConstraints { (cons) in
            cons.top.equalTo(img.snp.bottom).offset(40)
            cons.left.equalToSuperview().inset(15)
            cons.right.equalTo(like_button.snp.left).offset(-68)
        }
        like_button.snp.makeConstraints { (cons) in
            cons.width.equalTo(32)
            cons.height.equalTo(30)
            cons.right.equalToSuperview().inset(15)
            cons.centerY.equalTo(name)
        }
        contains.snp.makeConstraints { (cons) in
            cons.top.equalTo(name.snp.bottom).offset(14)
            cons.left.equalTo(self).inset(14)
        }
        containt_status.snp.makeConstraints { (cons) in
            cons.right.equalToSuperview().inset(15)
            cons.centerY.equalTo(contains)
        }
        line.snp.makeConstraints { (cons) in
            cons.top.equalTo(contains.snp.bottom).offset(13)
            cons.left.right.equalToSuperview().inset(0)
            cons.height.equalTo(0.5)
        }
        price.snp.makeConstraints { (cons) in
            cons.left.equalToSuperview().inset(14)
            cons.top.equalTo(line.snp.bottom).offset(9)
        }
      
        buy_button.snp.makeConstraints { (cons) in
            cons.left.right.equalToSuperview().inset(15)
            cons.bottom.equalTo(self).inset(19)
            cons.top.equalTo(price.snp.bottom).offset(25)
            cons.height.equalTo(43)
        }
        containt_status.text = "Есть в наличии"
        contains.text = "Наличие"
        buy_button.buy_button.layer.cornerRadius = 4
        buy_button.layer.cornerRadius = 4
        self.selectionStyle = .none
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addview()
        getcolor()
    }
    
    func getcolor() {
        self.backgroundColor = .white()
        contains.textColor = .custom_gray()
        price.textColor = .custom_gray()
        name.textColor = .custom_gray()
      
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


    
    var id : Int? = 0 {
        didSet {
            check(id: id!)
        }
    }
    
    var product : ProductElement? {
        willSet(product) {
        guard let product = product , let url = product.img else  { return
        }
            buy_button.write = WriteProduct(id: product.id ?? 0, price: product.price ?? 0, name: product.name ?? "", img: product.img ?? "", manufacturer: product.manufacturer ?? "")
            self.id = product.id ?? 0
            
            img.loadImageWithUrl(URL(string: url)!)
            name.text = product.name
            price.text = String(product.price ?? 0) + tg_sign
        
        }
 
    }

}
