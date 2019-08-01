//
//  MainPageProductViewModule.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/26/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation



class MainPageProductViewModule:ProductViewModuleType {
    
    
  
    
    func cellSingleViewModule(forindexPath indexPath: IndexPath) -> ProductViewCellModuleType? {
        let product = categoryModel[indexPath.row]
        return ProductViewCellViewModule(product: product)
    }
    
    private var selectedIndexPath : IndexPath?
    
  
    func SingleselectRow(atindexPath indexPath: IndexPath) -> DetailViewModelType? {
        let product = categoryModel[indexPath.row]
        
        return DetailViewModel(description: product)
    }
    
    func cellViewModule(forIndexPath indexPath: IndexPath, section: Int) -> ProductViewCellModuleType? {
        let product = categoryModel[section].category_content[indexPath.row]
        return ProductViewCellViewModule(product: product)
    }
    
    
    func numOfRows() -> Int {
        return categoryModel.count
    }
    
    
    
    var categoryModel: [CategoryContentModel] = []
    var banner = [Banner]()
    var categories = [Category]()
    
    
    func viewModuleForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexpath = selectedIndexPath else {return nil }
        return DetailViewModel(description: self.categoryModel[selectedIndexpath.section].category_content[selectedIndexpath.row])
    }
    
    func selectRow(atindexPath indexPath: IndexPath, atSection section: Int) {
        self.selectedIndexPath  = indexPath
        self.selectedIndexPath?.section = section
    }
   
    
    
    
}
