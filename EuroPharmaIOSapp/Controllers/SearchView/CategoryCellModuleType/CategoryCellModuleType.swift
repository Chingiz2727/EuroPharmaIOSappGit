//
//  CategoryCellModuleType.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/2/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
protocol CategoryCellModuleType:class {
    var id : Int {get}
    var img_url : String {get}
    var title:String {get}
}
