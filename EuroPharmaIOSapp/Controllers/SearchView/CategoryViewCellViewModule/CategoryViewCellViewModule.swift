//
//  CategoryViewCellViewModule.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/2/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
class CategoryViewCellViewModule: CategoryCellModuleType {
    var id: Int {return category.id ?? 0}
    
    var img_url: String {return category.icon ?? ""}
    
    var title: String {return category.name ?? ""}
    
    private var category : Category
    
    init(cat:Category) {
        self.category = cat
    }
    
}
