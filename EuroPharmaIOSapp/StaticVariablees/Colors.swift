//
//  Colors.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/16/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    
    class func custom_gray() -> UIColor {
        
        return #colorLiteral(red: 0.2156862745, green: 0.2588235294, blue: 0.3019607843, alpha: 1)
    }
    class func custom_gray1() -> UIColor {
        return #colorLiteral(red: 0.1960784314, green: 0.2274509804, blue: 0.2509803922, alpha: 1)
    }
    class func custom_gray2() -> UIColor {
        return #colorLiteral(red: 0.2, green: 0.2470588235, blue: 0.2823529412, alpha: 1)
    }

    class func custom_white() -> UIColor {
        return #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
    }
    class func custom_gray_text() -> UIColor {
        return #colorLiteral(red: 0.7411764706, green: 0.7529411765, blue: 0.7607843137, alpha: 1)
    }
    class func custom_green() -> UIColor {
        return #colorLiteral(red: 0.7725490196, green: 0.8901960784, blue: 0.09803921569, alpha: 1)
    }
    class func custom_green1() -> UIColor {
        return #colorLiteral(red: 0.7235844731, green: 0.8195508718, blue: 0.2157313526, alpha: 1)
    }
    class func custom_green2() -> UIColor {
        return #colorLiteral(red: 0.7725490196, green: 0.8901960784, blue: 0.09803921569, alpha: 1)
    }
    class func white() -> UIColor {
           return #colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)
       }
    
}
extension String {
    static func return_tg() -> String {
        return "₸"
    }
}
