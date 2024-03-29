//
//  EndPointType.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/29/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL : URL {get}
    var path : String {get}
    var httpMethod: HTTPMethods {get}
    var task : HTTPTask? {get}
    var header : HTTPHeaders? {get}
}
