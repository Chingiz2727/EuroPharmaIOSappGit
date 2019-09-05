//
//  ProductListView.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/29/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class ProductListView: UIView {
    
    let columnLayout2 = ColumnFlowLayout(cellsPerRow: 2, cellheight: 280, cellwidth: 0, minimumInteritemSpacing: 0.3, minimumLineSpacing: 0.3, sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    let columnLayout = ColumnFlowLayout(cellsPerRow: 1, cellheight: 134, cellwidth: 0, minimumInteritemSpacing: 0.3, minimumLineSpacing: 0.3, sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.bounces = false
        collection.isScrollEnabled = true
        collection.backgroundColor = .white()
        
        return collection
    }()
    
    let content_setting = ContentSettingView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let type = content_type.get_content_type()
        switch type {
        case 0:
            collectionView.collectionViewLayout = columnLayout
        default:
            collectionView.collectionViewLayout = columnLayout2
        }
        self.addSubview(collectionView)
        self.addSubview(content_setting)
        
        content_setting.snp.makeConstraints { (cons) in
            cons.left.right.top.equalToSuperview()
            cons.height.equalTo(40)
        }
        
        collectionView.snp.makeConstraints { (cons) in
            cons.top.equalTo(content_setting.snp.bottom).offset(0)
            cons.left.right.bottom.equalTo(self).inset(0)
        }
       
      
        columnLayout.scrollDirection = .vertical
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
