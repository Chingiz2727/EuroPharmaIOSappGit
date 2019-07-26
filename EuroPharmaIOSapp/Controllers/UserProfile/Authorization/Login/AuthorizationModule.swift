//
//  AuthorizationModule.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/26/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import RealmSwift
class AuthorizationModule : Codable {
    var token : String?
    var expired : String?
    var expired_at : Int?
    init(token:String?,expired:String?,expired_at:Int?) {
        self.token = token
        self.expired = expired
        self.expired_at = expired_at
    }
    
 
}

class UserModule : Codable {
    var id : Int?
    var phone : String?
    var email : String?
    var first_name : String?
    var last_name : String?
    var logo : String?
    var city_id : Int?
    init(id:Int?,phone:String?,email:String?,first_name:String?,last_name:String?,logo:String?,city_id:Int?) {
        self.id = id
        self.phone = phone
        self.first_name = first_name
        self.last_name = last_name
        self.logo = logo
        self.city_id = city_id
    }
}

class UserData: Object {
    @objc dynamic var token : String? = nil
    @objc dynamic var id : Int = 0
    @objc dynamic var phone : String? = nil
    @objc dynamic var first_name : String? = nil
    @objc dynamic var last_name : String? = nil
    @objc dynamic var logo : String? = nil
    @objc dynamic var city_id : Int = 0
}
