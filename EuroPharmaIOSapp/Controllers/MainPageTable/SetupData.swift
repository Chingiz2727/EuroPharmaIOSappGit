//
//  SetupData.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/23/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
class SetupData {
    lazy var categoryItems = [CategoryContentModel]()
    var banner : [Banner]?
     var categories : [Category]?
    func setupFakeDemoData(completion:@escaping(_ error:Bool?)->()) {
        //Setup row 1 of table to be a list of sport categories
        Networking.Request(type: Product.self, params: nil, header: ["CityId":"1"], url: Endpoint.main_url.rawValue + Endpoint.mainpage.rawValue, method: .get) { [weak self] (data, success, error) in
            DispatchQueue.main.async {
                if success == true {
                    if let info = data {
                            self?.banner = info.banners
                            self?.categories = info.categories
                            if let discount = info.discounts {
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
                            self?.categoryItems.append(row2)
                            
                        }
                        if let product = info.products {
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
                            self?.categoryItems.append(row3)
                            
                            completion(true)
                        }
                    }
                    completion(false)
                }
            }
            
        }
    }
}
