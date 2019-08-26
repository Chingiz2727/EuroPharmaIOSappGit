//
//  TypeOfContetns.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/6/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation

class content_type {
    
    class func ChangeType(type:Int) {
        let defaults = UserDefaults.standard
        defaults.setValue(type, forKey: "content_type")
    }
    
    class func get_content_type() -> Int {
        let defaults = UserDefaults.standard
       let type = defaults.value(forKey: "content_type") as? Int
        return type ?? 0
    }
}
