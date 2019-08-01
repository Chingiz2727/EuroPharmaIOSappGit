//
//  ProductViewCellViewModule.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/26/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
class ProductViewCellViewModule:ProductViewCellModuleType {
    var title: String {
        return product.title ?? ""
    }
    
    var type: String {return product.type ?? ""}
    
    var old_price: Int {return product.old_price ?? 0}
    
    var new_price: Int {return product.new_price ?? 0}
    
    var menufacturer: String {return product.menufacturer ?? ""}
    
    var category: String {return product.category ?? ""}
    
    var img_url: String {return product.img_url ?? ""}
    
    var id: Int {return product.id ?? 0}
    
    private var product : CategoryContentModel
    
    init(product:CategoryContentModel) {
        self.product = product
    }
}
