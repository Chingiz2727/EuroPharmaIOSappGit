//
//  LabelExtension.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
extension UILabel {
    func CustomLabel(textAlignment:NSTextAlignment,color:UIColor,font:UIFont)  {
        self.textAlignment = textAlignment
        self.textColor = color
        self.font = font
    }
}
