//
//  SetupData.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/23/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
import SKActivityIndicatorView
extension MainPageTable {
    func SetupData() {
        
        SKActivityIndicator.show()
        networkManager.getShopList { (product, error) in
            guard let product = product else {
                SKActivityIndicator.dismiss()
                CustomAlert.customAlert.showalert(controller: self, text: "Ошибка", message: error)
                return
            }
            
            DispatchQueue.main.async {
                self.Module.banner = product.banners ?? []
                self.Module.categories = product.categories ?? []
                    if let discount = product.discounts {
                        let row2 = CategoryContentModel()
                        row2.title = "Акционные товары"
                        row2.type = "rugby_layout"
                        var row2content = [CategoryContentModel]()
                        for item in discount {
                            let cell = CategoryContentModel()
                            cell.title = item.name  ?? ""
                            cell.img_url = item.img ?? ""
                            cell.type = "rugby_layout"
                            cell.old_price = item.priceOriginal
                            cell.new_price = item.price
                            cell.id = item.id
                            cell.menufacturer = item.manufacturer
                            cell.category = item.category
                            row2content.append(cell)
                        }
                        row2.category_content = row2content
                        self.Module.categoryModel.append(row2)
                    }
                    
                    if let product = product.products {
                        let row3 = CategoryContentModel()
                        row3.title = "Популярные товары"
                        row3.type = "rugby_layout"
                        var row3content = [CategoryContentModel]()
                        for item in product {
                            let cell = CategoryContentModel()
                            cell.title = item.name  ?? ""
                            cell.img_url = item.img ?? ""
                            cell.type = "rugby_layout"
                            cell.id = item.id
                            cell.old_price = item.priceOriginal
                            cell.new_price = item.price
                            cell.menufacturer = item.manufacturer
                            cell.category = item.category
                            row3content.append(cell)
                        }
                        row3.category_content = row3content
                        self.Module.categoryModel.append(row3)
                        
                    }
                SKActivityIndicator.dismiss()
                self.tableView.reloadData()
                
            }
        }
    }
  
}
