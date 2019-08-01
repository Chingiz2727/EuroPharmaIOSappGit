//
//  CategoryRowCell.swift
//  tableview_with_colletionview
//
//  Created by Robert Hills on 04/03/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import ZKCarousel
import Alamofire
class MainPageCategoryRowCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    var category = [Category]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! CategoryCollectionViewCell
        cell.category = category[indexPath.row]
        cell.img.dropShadow(color: .black, opacity: 0.1, offSet: CGSize(width: 1, height: 1), radius: 1, scale: true)
        cell.layoutIfNeeded()

        return cell
    }
    let cellid = "cellid"
    let titleLbl = UILabel()
    var slides : [ZKCarouselSlide] = []
    var banner : [Banner]?
    
    let carousel : ZKCarousel = {
        let carousel = ZKCarousel()
        
        return carousel
    }()
    
    var select : RemoveAtCell?

    lazy var horizontalLayout: UICollectionViewFlowLayout = {
        let tmpLayout = UICollectionViewFlowLayout()
        let width = bounds.size.width //should adjust for inset
        tmpLayout.estimatedItemSize = CGSize(width: width, height: 100)
        tmpLayout.scrollDirection = .vertical
        return tmpLayout
    }()
    
    let columnLayout = ColumnFlowLayout(cellsPerRow: 1, cellheight: 130, cellwidth: 120, minimumInteritemSpacing: 10, minimumLineSpacing: 20, sectionInset: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
    
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
        self.addlayer()
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellid)
        collectionView.delegate = self
        collectionView.dataSource = self
        columnLayout.scrollDirection = .horizontal
        columnLayout.collectionView?.backgroundColor = .custom_white()
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cat = category[indexPath.row]
        select?.removeAtItem(item: cat.id ?? 0)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    lazy var stack  = UIStackView()
    func addlayer() {
        titleLbl.textColor = .black
        titleLbl.numberOfLines = 1
        titleLbl.textAlignment = .left
    }
    
    func setupCategoryViews() {
        //First configure all views and then setup the constraints..
        self.addSubview(carousel)
        addSubview(titleLbl)
        titleLbl.font = UIFont.init(name: "Arial", size: 22)
        titleLbl.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).inset(10)
            cons.left.equalTo(self).inset(10)
        }
        carousel.interval = 3

        carousel.snp.makeConstraints { (cons) in
            cons.top.equalTo(titleLbl.snp.bottom).offset(10)
            cons.left.right.equalTo(self).inset(0)
            cons.height.equalTo(230)
            cons.bottom.equalTo(self).inset(0)
        }
        
        //Clear background colour
        //Category Title
    
        //See All

        
        collectionView.backgroundColor = .custom_white()
        //Collection View
      
        
    
        
        self.backgroundColor = .clear
        //Now views are setup, lets add the constraints..
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDelegate & UICollectionViewDataSource>(_ dataSourceDelegate: D, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}
