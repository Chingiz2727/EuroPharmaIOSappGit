//
//  CollapsedSection.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/6/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
struct Section {
    var content : String
    var items : [String]
    var collapsed : Bool
    
    init(content:String,item:[String]) {
        self.content = content
        self.items = item
        self.collapsed = true
    }
}
