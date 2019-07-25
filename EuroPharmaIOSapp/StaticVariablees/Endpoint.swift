//
//  Endpoint.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/17/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
enum Endpoint : String {
    case auth = "/auth"
    case userinfo = "/app/v1/user"
    case userorders = "/v1/user/orders"
    case products = "/app/v1/products"
    case categories = "/app/v1/categories/"
    case mainpage = "/app/v1/main"
    case main_url = "https://api.europharma.kz"
}
