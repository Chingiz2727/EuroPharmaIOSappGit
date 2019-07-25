//
//  CarouselView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/16/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import Alamofire
import ZKCarousel
class CarouselView: UIView {
    var slides : [ZKCarouselSlide] = [] {
        didSet {
            carousel.slides = slides
        }
    }
    
    let carousel : ZKCarousel = {
        let carousel = ZKCarousel()
        
        return carousel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(carousel)
        carousel.snp.makeConstraints { (cons) in
            cons.left.right.top.bottom.equalTo(self).inset(0)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
}
