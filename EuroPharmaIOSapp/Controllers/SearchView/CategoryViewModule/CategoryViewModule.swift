//
//  CategoryViewModule.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/2/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
class CategoryViewModule : CategoryModuleType {
    func numofRows() -> Int {
        return category.count
    }
    
    func cellViewModuleForIndexPath(indexpath: IndexPath) -> CategoryCellModuleType {
        let cat = CategoryViewCellViewModule(cat: category[indexpath.row])
        return cat
    }
    
    func selectrowAtIndexPath(indexpath: IndexPath) {
        
    }
    
    var category =  [Category]()
    
    
}
