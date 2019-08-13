//
//  CustomFont.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/5/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
extension UILabel {
     func get_regular(size:CGFloat) {
        self.font = UIFont(name: "SegoeUI", size: size)
        
    }
    
     func get_bold(size:CGFloat){
       self.font = UIFont(name: "SegoeUI", size: size)
        self.font = UIFont.boldSystemFont(ofSize: size)
    }
}
