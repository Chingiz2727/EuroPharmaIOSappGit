//
//  ShopEndPoint.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/29/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import RealmSwift
public enum ShopApi {
    case auth(phone:String,password:String)
    case product(id:Int)
    case categories(id:Int)
    case mainpage
    case catalog(id:Int)
    case userInfo(token:String)
    case getCityList
}


extension ShopApi:EndPointType {
    var httpMethod: HTTPMethods {
        switch self {
        case .auth(let phone,let pass):
            return .post
        default:
            return .get

        }
    }
    

    var baseURL: URL {
        guard let url = URL(string: "https://api.europharma.kz") else {fatalError("Failure with error")}
        return url
    }
    
    var path: String {
        switch  self {
        case .categories(let id):
            return "/app/v1/categories/\(id)"
        case .product(let id):
            
            return "/app/v1/products/\(id)"
        case .auth(let phone, let password):
            return "/auth"
            
        case .mainpage:
            return "/app/v1/main"
        case .catalog(let id):
            return "/app/v1/catalog/\(id)"
        case.userInfo(let token):
            
            return "/app/v1/user"
        case .getCityList:
            return "/app/v1/cities"
            
        }
    }
    
   
    
    var task: HTTPTask? {
        let realm = try! Realm().objects(SavedCity.self)
        print("CityID")
        var id_c : Int = 0
        if let id = realm.first?.id  {
            id_c = id
        }
        switch self {
        case .auth(let phone,let password):
            print(phone)
            print(password)
            return .requestParametersAndHeaders(bodyParameters: ["phone":phone,"password":password], bodyEncoding: .jsonEncoding, urlParameters: nil, additionHeaders: nil, method: .post)
            
        case .categories(let id):
            return .request
        case .mainpage:
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: ["CityId":"\(id_c)"],method:.get)
        case .product(let id):
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: ["CityId":"\(id_c)"], method:.get)
        case .catalog(let id):
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: ["CityId":"\(id_c)"],method:.get)
        case .userInfo(let token):
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: ["Authorization":"Bearer \(token)"],method:.get)
        case .getCityList:
            return .request
        default:
            return .request
        }
    }
    
    var header: HTTPHeaders? {
        return nil
    }
    
    
}
