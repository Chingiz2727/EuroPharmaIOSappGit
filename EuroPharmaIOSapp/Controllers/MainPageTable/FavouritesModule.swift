//
//  FavouritesModule.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/25/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import RealmSwift

class FavouritesModule: Object {
    @objc dynamic var id : Int = 0
    @objc dynamic var name : String? = nil
    @objc dynamic var img_url : String? = nil
    @objc dynamic var cost : Int = 0
    @objc dynamic var manufacturer : String? = nil
    
}
