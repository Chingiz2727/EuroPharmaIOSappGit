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
    let seeAllBtn = UIButton()
    lazy var horizontalLayout: UICollectionViewFlowLayout = {
        let tmpLayout = UICollectionViewFlowLayout()
        let width = bounds.size.width //should adjust for inset
        tmpLayout.estimatedItemSize = CGSize(width: width, height: 100)
        tmpLayout.scrollDirection = .horizontal
        return tmpLayout
    }()
    
      let columnLayout = ColumnFlowLayout(cellsPerRow: 1, cellheight: 210, cellwidth: 150, minimumInteritemSpacing: 6, minimumLineSpacing: 6, sectionInset: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0))
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.bounces = false
        collection.collectionViewLayout = columnLayout
        collection.isScrollEnabled = true
        collection.backgroundColor = .custom_white()
        
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
        self.addSubview(stack)
        stack.customStack(view: [titleLbl,seeAllBtn], distribution: .fillProportionally, spacing: 5)
        stack.axis = .horizontal
      
        //Category Title
        titleLbl.textColor = .custom_gray()
        titleLbl.numberOfLines = 1
        titleLbl.textAlignment = .left
       titleLbl.get_regular(size: 16)
        
        seeAllBtn.setTitle("Смотреть все", for: .normal)
        seeAllBtn.setTitleColor(.gray, for: .normal)
        
        seeAllBtn.titleLabel?.get_regular(size: 13)
        seeAllBtn.titleLabel?.textAlignment = .right
        seeAllBtn.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.backgroundColor = .custom_white()
        //Collection View
       
        stack.snp.makeConstraints { (cons) in
            
            cons.top.equalTo(self).inset(15)
            cons.left.right.equalTo(self).inset(15)
            
           
        }
        
        self.backgroundColor = .custom_white()
        //Now views are setup, lets add the constraints..
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(0)
            cons.top.equalTo(seeAllBtn.snp.bottom).offset(5)
            
            cons.bottom.equalTo(self).inset(0)
            cons.height.equalTo(220)
        }
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDelegate & UICollectionViewDataSource>(_ dataSourceDelegate: D, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}
