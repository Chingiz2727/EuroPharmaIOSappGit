//
//  ProductListView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/29/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class ProductListView: UIView {
    let columnLayout = ColumnFlowLayout(cellsPerRow: 2, cellheight: 280, cellwidth: 0, minimumInteritemSpacing: 10, minimumLineSpacing: 20, sectionInset: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.bounces = false
        collection.collectionViewLayout = columnLayout
        collection.isScrollEnabled = true
        collection.backgroundColor = .clear
        
        return collection
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
  
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (cons) in
            cons.left.right.top.bottom.equalTo(self).inset(0)
        }
        columnLayout.scrollDirection = .vertical
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
