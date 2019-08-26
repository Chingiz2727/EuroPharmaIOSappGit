//
//  ImagesCollectionViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    let images = ImageLoader()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(images)
        images.contentMode = .scaleAspectFit
        images.snp.makeConstraints { (cons) in
            cons.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
