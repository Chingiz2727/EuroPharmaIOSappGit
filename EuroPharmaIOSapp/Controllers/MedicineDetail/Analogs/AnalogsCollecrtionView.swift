//
//  AnalogsCollecrtionView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 9/4/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
//  AnalogsCollectionVIew.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/6/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class AnalogsCollectionVIew: UIView {
    
    var analogs = [Analog]()
    
    var columnLayout2 = ColumnFlowLayout(cellsPerRow: 1, cellheight: 130, cellwidth: 0, minimumInteritemSpacing: 1, minimumLineSpacing: 0.3, sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: columnLayout2)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.bounces = false
        collection.collectionViewLayout = columnLayout2
        collection.isScrollEnabled = true
        collection.backgroundColor = .clear
        collection.allowsSelection = true
        return collection
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (cons) in
            cons.width.height.equalToSuperview()
        }
        collectionView.register(AnalogCollectionViewCell.self, forCellWithReuseIdentifier: MainPageIdentifiers().categoryid)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
