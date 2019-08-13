//
//  ShopEndPoint.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/29/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
public enum ShopApi {
    case auth(phone:String,password:String)
    case product(id:Int)
    case categories(id:Int)
    case mainpage
}


extension ShopApi:EndPointType {
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
        default:
            break
        }
    }
    
    var httpMethod: HTTPMethods {
        return .get
    }
    
    var task: HTTPTask? {
        switch self {
        case .auth(let phone,let password):
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: ["phone":phone,"password":password])
        case .categories(let id):
            return .request
        case .mainpage:
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: ["CityId":"1"])
        case .product(let id):
            return .requestParametersAndHeaders(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil, additionHeaders: ["CityId":"1"])
        default:
            return .request
        }
    }
    
    var header: HTTPHeaders? {
        return nil
    }
    
    
}
