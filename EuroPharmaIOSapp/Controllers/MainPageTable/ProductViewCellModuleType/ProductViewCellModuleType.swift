//
//  ProductViewCellModuleType.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/26/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
protocol ProductViewCellModuleType:class {
    var title: String {get set}
    var type: String {get}
    var old_price : Int {get}
    var new_price : Int {get}
    var menufacturer : String {get}
    var category : String {get}
    var img_url : String {get}
    var id : Int {get}
}
