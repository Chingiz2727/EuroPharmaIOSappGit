//
//  EuroGuideModule.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
class EuroGuideModule {
    var img : UIImage?
    var isBold : Bool?
    var text : String?
    var title : String?
    
    init(img:UIImage?,isbold:Bool,text:String,title:String?) {
        self.img = img
        self.isBold = isbold
        self.text = text
        self.title = title
    }
}


