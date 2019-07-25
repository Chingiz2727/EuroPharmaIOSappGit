//
//  BasketModule.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/25/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import RealmSwift

class BasketModule: Object {
    @objc dynamic var name : String = ""
   @objc dynamic  var count : Int = 0
   @objc dynamic var img_url : String? = ""
    @objc dynamic var cost : Int = 0
    @objc dynamic var id : Int = 0
}

