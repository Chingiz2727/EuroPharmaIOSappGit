//
//  CategoryRowCell.swift
//  tableview_with_colletionview
//
//  Created by Robert Hills on 04/03/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
class CategoryRowCell: UITableViewCell {
    let titleLbl = UILabel()
    let seeAllBtn = UILabel()
    lazy var horizontalLayout: UICollectionViewFlowLayout = {
        let tmpLayout = UICollectionViewFlowLayout()
        let width = bounds.size.width //should adjust for inset
        tmpLayout.estimatedItemSize = CGSize(width: width, height: 100)
        tmpLayout.scrollDirection = .horizontal
        return tmpLayout
    }()
    
      let columnLayout = ColumnFlowLayout(cellsPerRow: 1, cellheight: 260, cellwidth: 200, minimumInteritemSpacing: 10, minimumLineSpacing: 20, sectionInset: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setupCategoryViews()
        columnLayout.scrollDirection = .horizontal
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
      
    }
    lazy var stack  = UIStackView()
    
    func setupCategoryViews() {
        //First configure all views and then setup the constraints..
        
        //Clear background colour
        addSubview(titleLbl)
        addSubview(seeAllBtn)
        //Category Title
        titleLbl.textColor = .black
        titleLbl.numberOfLines = 1
        titleLbl.textAlignment = .left
       

        //See All
        seeAllBtn.text = "Смотреть все"
        seeAllBtn.textColor = .custom_gray()
        seeAllBtn.textColor = .black
        seeAllBtn.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.backgroundColor = .custom_white()
        //Collection View
        titleLbl.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(5)
            cons.left.equalTo(self).inset(10)
        }
        seeAllBtn.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(5)
            cons.right.equalTo(self).inset(10)
            
           
        }
        
        self.backgroundColor = .clear
        //Now views are setup, lets add the constraints..
        addSubview(collectionView)

        collectionView.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(0)
            cons.top.equalTo(seeAllBtn.snp.bottom).offset(5)
            cons.bottom.equalTo(self).inset(2)
            cons.height.equalTo(300)
        }
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDelegate & UICollectionViewDataSource>(_ dataSourceDelegate: D, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}