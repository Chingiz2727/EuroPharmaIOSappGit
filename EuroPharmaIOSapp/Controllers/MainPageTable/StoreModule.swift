// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let product = try? newJSONDecoder().decode(Product.self, from: jsonData)

import Foundation

// MARK: - Product
class Product: Codable {
    var banners: [Banner]?
    var categories: [Category]?
    var products: [ProductElement]?
    var discounts: [Discount]?
    
    init(banners: [Banner]?, categories: [Category]?, products: [ProductElement]?, discounts: [Discount]?) {
        self.banners = banners
        self.categories = categories
        self.products = products
        self.discounts = discounts
    }
    deinit {
        print("Deinited")
    }
}

// MARK: - Banner
class Banner: Codable {
    var id: Int?
    var image: String?
    var link, target: String?
    
    init(id: Int?, image: String?, link: String?, target: String?) {
        self.id = id
        self.image = image
        self.link = link
        self.target = target
    }
}

// MARK: - Category
class Category: Codable {
    var id: Int?
    var name: String?
    var icon: String?

    init(id: Int?, name: String?, icon: String?,country:String?) {
        self.id = id
        self.name = name
        self.icon = icon
   
    }
}

// MARK: - Discount
class Discount: Codable {
    var id: Int?
    var name, slug, model, sku: String?
    var upc: String?
    var url: String?
    var img: String?
    var price, priceOriginal: Int?
    var country, category, manufacturer: String?
    
    init(id: Int?, name: String?, slug: String?, model: String?, sku: String?, upc: String?, url: String?, img: String?, price: Int?, priceOriginal: Int?, country: String?, category: String?, manufacturer: String?) {
        self.id = id
        self.name = name
        self.slug = slug
        self.model = model
        self.sku = sku
        self.upc = upc
        self.url = url
        self.img = img
        self.price = price
        self.priceOriginal = priceOriginal
        self.country = country
        self.category = category
        self.manufacturer = manufacturer
    }
}

// MARK: - ProductElement
class ProductElement: Codable {
    var id: Int?
    var name: String?
    var url: String?
    var img: String?
    var price, priceOriginal: Int?
    var analogs: [Analog]?
    var country, category, manufacturer: String?

    init(id: Int?, name: String?, url: String?, img: String?, price: Int?, priceOriginal: Int?, analogs: [Analog]?,country:String?,category:String?,manufacturer:String?) {
        self.id = id
        self.name = name
        self.url = url
        self.img = img
        self.price = price
        self.priceOriginal = priceOriginal
        self.analogs = analogs
        self.country = country
        self.category = category
        self.manufacturer = manufacturer
    }
}

// MARK: - Analog
class Analog: Codable {
    var id: Int?
    var name: String?
    var img: String?
    let price, priceOriginal: Int?
    
    init(id: Int?, name: String?, img: String?, price: Int?, priceOriginal: Int?) {
        self.id = id
        self.name = name
        self.img = img
        self.price = price
        self.priceOriginal = priceOriginal
    }
}
