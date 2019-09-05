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
    let total_price = UILabel()
    
    var total_price_text : String?  {
        didSet {
            total_price.text = total_price_text
        }
    }
    
    var remove_item : RemoveAtCell?
    var item : BasketModule? {
        willSet(item) {
            total_price.text = String(item!.count * item!.cost) + tg_sign
            desc.text = item?.name
            price.text = String(item?.cost ?? 0) + " ₸"
            buy.count = item?.count ?? 0
            img.loadImageWithUrl(URL(string: item?.img_url ?? "")!)
        }
        
    }
    let manufacturer : UILabel = UILabel()

    

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
    
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addview()
        self.backgroundColor = .white
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let fav = FavouriteView()
    let buy = BuyProductsButton()
    func addview() {
    
    }
    

    
}
