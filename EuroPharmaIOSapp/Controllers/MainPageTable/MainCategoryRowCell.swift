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
        cell.dropShadow()
        cell.dropShadow(color: .black, opacity: 0.2, offSet: CGSize(width: 5, height: 5), radius: 2, scale: true)
        cell.layoutIfNeeded()

        return cell
    }
    let cellid = "cellid"
    let titleLbl = UILabel()
    var slides : [ZKCarouselSlide] = [] {
        didSet {
            carousel.slides = slides
        }
    }
    
    let carousel : ZKCarousel = {
        let carousel = ZKCarousel()
        
        return carousel
    }()
    
    let img = ImageLoader()
    var banner = [Banner]()
    var select : RemoveAtCell?

    lazy var horizontalLayout: UICollectionViewFlowLayout = {
        let tmpLayout = UICollectionViewFlowLayout()
        let width = bounds.size.width //should adjust for inset
        tmpLayout.estimatedItemSize = CGSize(width: width, height: 100)
        tmpLayout.scrollDirection = .horizontal
        return tmpLayout
    }()
    
    let columnLayout = ColumnFlowLayout(cellsPerRow: 1, cellheight: 200, cellwidth: 130, minimumInteritemSpacing: 10, minimumLineSpacing: 20, sectionInset: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
    
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
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellid)
        collectionView.delegate = self
        collectionView.dataSource = self
        columnLayout.scrollDirection = .horizontal
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
        titleLbl.text = "Категории"
        
    }
    func setupCategoryViews() {
        //First configure all views and then setup the constraints..
        self.addSubview(carousel)
        carousel.snp.makeConstraints { (cons) in
            cons.left.right.top.equalTo(self).inset(0)
            cons.height.equalTo(230)
        }
        
        //Clear background colour
        addSubview(titleLbl)
        //Category Title
    
        //See All

        
        collectionView.backgroundColor = .custom_white()
        //Collection View
        titleLbl.snp.makeConstraints { (cons) in
            cons.top.equalTo(carousel.snp.bottom).offset(5)
            cons.left.equalTo(self).inset(10)
        }
        
    
        
        self.backgroundColor = .clear
        //Now views are setup, lets add the constraints..
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(4)
            cons.top.equalTo(titleLbl.snp.bottom).offset(10)
            cons.bottom.equalTo(self).inset(10)
            cons.height.equalTo(200)
        }
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDelegate & UICollectionViewDataSource>(_ dataSourceDelegate: D, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}
