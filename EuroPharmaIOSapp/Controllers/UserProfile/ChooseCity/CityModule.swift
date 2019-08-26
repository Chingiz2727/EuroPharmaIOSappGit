import Foundation

class CityModuleElement: Codable {
    let id: Int?
    let name, slug: String?
    let isDefault: Int?
    let fieldsJSON: FieldsJSON?
    let sortOrder, status: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case isDefault = "is_default"
        case fieldsJSON = "fields_json"
        case sortOrder = "sort_order"
        case status
    }
    
    init(id: Int?, name: String?, slug: String?, isDefault: Int?, fieldsJSON: FieldsJSON?, sortOrder: Int?, status: Int?) {
        self.id = id
        self.name = name
        self.slug = slug
        self.isDefault = isDefault
        self.fieldsJSON = fieldsJSON
        self.sortOrder = sortOrder
        self.status = status
    }
}

// MARK: - FieldsJSON
class FieldsJSON: Codable {
    let lat, lng, phone, queue: String?
    let mapURL, payboxID, payboxKey, discountLs: String?
    let phoneCode, kaspiCityID, lsOverPrice, officePhone: String?
    let deliveryTime, discountNotLs, officeAddress, kaspiServiceID: String?
    let lsOverDiscount, googleAnalyticsID: String?
    
    enum CodingKeys: String, CodingKey {
        case lat, lng, phone, queue
        case mapURL = "mapUrl"
        case payboxID = "payboxId"
        case payboxKey, discountLs
        case phoneCode = "phone_code"
        case kaspiCityID = "kaspiCityId"
        case lsOverPrice, officePhone, deliveryTime, discountNotLs, officeAddress
        case kaspiServiceID = "kaspiServiceId"
        case lsOverDiscount
        case googleAnalyticsID = "googleAnalyticsId"
    }
    
    init(lat: String?, lng: String?, phone: String?, queue: String?, mapURL: String?, payboxID: String?, payboxKey: String?, discountLs: String?, phoneCode: String?, kaspiCityID: String?, lsOverPrice: String?, officePhone: String?, deliveryTime: String?, discountNotLs: String?, officeAddress: String?, kaspiServiceID: String?, lsOverDiscount: String?, googleAnalyticsID: String?) {
        self.lat = lat
        self.lng = lng
        self.phone = phone
        self.queue = queue
        self.mapURL = mapURL
        self.payboxID = payboxID
        self.payboxKey = payboxKey
        self.discountLs = discountLs
        self.phoneCode = phoneCode
        self.kaspiCityID = kaspiCityID
        self.lsOverPrice = lsOverPrice
        self.officePhone = officePhone
        self.deliveryTime = deliveryTime
        self.discountNotLs = discountNotLs
        self.officeAddress = officeAddress
        self.kaspiServiceID = kaspiServiceID
        self.lsOverDiscount = lsOverDiscount
        self.googleAnalyticsID = googleAnalyticsID
    }
}

typealias CityModule = [CityModuleElement]
