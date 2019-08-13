//
//  AddtoFavouriteVieew.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/8/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class FavouriteView: UIView {
    
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
    var viewModule : ProductViewCellModuleType? {
        willSet(viewModule) {
            guard  let viewModule = viewModule else {
                return
            }
            
            
        }
    }
    
    @objc func remove_fav() {
        guard  let viewModule = viewModule else {
            return
        }
        let realm = try? Realm()
        let results = try! Realm().objects(FavouritesModule.self)
        for i in results {
            if i.id == viewModule.id {
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
        guard  let viewModule = viewModule else {
            return
        }
        let realm = try? Realm()
        let fav = FavouritesModule()
        var fav_list = [FavouritesModule]()
        fav.id = viewModule.id
        fav.cost = viewModule.new_price
        fav.img_url = viewModule.img_url
        fav.name = viewModule.title
        fav_list.append(fav)
        try? realm?.write {
            realm?.add(fav_list)
            like_button.setImage(UIImage(named: "333"), for: .normal)
            
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(like_button)
        like_button.snp.makeConstraints { (cons) in
            cons.width.height.equalToSuperview()
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
