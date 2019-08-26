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
            cell.layer.cornerRadius = 5
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

    
    let columnLayout = ColumnFlowLayout(cellsPerRow: 1, cellheight: 108, cellwidth: 106, minimumInteritemSpacing: 6, minimumLineSpacing: 6, sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    
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
        self.addSubview(collectionView)
        self.addSubview(titleLbl)
        titleLbl.textColor = .custom_gray()
        titleLbl.get_regular(size: 16)
        carousel.interval = 3
            carousel.layer.cornerRadius = 5
        
        carousel.snp.makeConstraints { (cons) in
            cons.top.equalTo(self).offset(10)
            cons.left.right.equalTo(self).inset(0)
            cons.height.equalTo(230)
//            cons.bottom.equalTo(self).inset(0)
        }
        titleLbl.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(10)
            cons.top.equalTo(carousel.snp.bottom).offset(10)
        }
        titleLbl.text = "Категории"
        titleLbl.get_regular(size: 16)
        titleLbl.textColor = .custom_gray()
        carousel.layoutIfNeeded()
        collectionView.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(10)
            cons.top.equalTo(titleLbl.snp.bottom).offset(5)
            cons.height.equalTo(110)
            cons.bottom.equalTo(self).inset(0)
        }
        
     
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDelegate & UICollectionViewDataSource>(_ dataSourceDelegate: D, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}
extension UITextField {
    
    enum Direction {
        case Left
        case Right
    }
    

    func withImage(direction: Direction, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        mainView.layer.cornerRadius = 5
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = CGFloat(0.5)
        view.layer.borderColor = colorBorder.cgColor
        mainView.addSubview(view)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
        view.addSubview(imageView)
        
        let seperatorView = UIView()
        seperatorView.backgroundColor = colorSeparator
        mainView.addSubview(seperatorView)
        
        if(Direction.Left == direction){ // image left
            seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
            self.leftViewMode = .always
            self.leftView = mainView
        } else { // image right
            seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
            self.rightViewMode = .always
            self.rightView = mainView
        }
        self.layer.borderColor = colorBorder.cgColor
        self.layer.borderWidth = CGFloat(0.5)
        self.layer.cornerRadius = 5
    }
    
}
