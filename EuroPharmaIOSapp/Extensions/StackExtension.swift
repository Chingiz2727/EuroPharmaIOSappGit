//
//  StackExtension.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/18/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    func customStack(view:[UIView],distribution:Distribution,spacing:CGFloat) {
        for i in view {
            self.addArrangedSubview(i)
        }
        self.distribution = distribution
        self.spacing = spacing
        
    }
    
}
