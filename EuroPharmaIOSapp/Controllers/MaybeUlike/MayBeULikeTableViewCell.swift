//
//  MayBeULikeTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/8/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MayBeULikeTableViewCell: UITableViewCell {
    let columnLayout = ColumnFlowLayout(cellsPerRow: 1, cellheight: 223, cellwidth: 165, minimumInteritemSpacing: 1, minimumLineSpacing: 20, sectionInset: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
    
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
    
    let makeorderbutton = UIButton()
    let title = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        columnLayout.scrollDirection = .horizontal
        self.backgroundColor = .custom_white()
        addview()
    }
    func addview() {
        self.addSubview(makeorderbutton)
        makeorderbutton.snp.makeConstraints { (cons) in
            cons.top.left.right.equalTo(self).inset(15)
            cons.height.equalTo(43)
        }
        makeorderbutton.layer.cornerRadius = 4
        makeorderbutton.setTitle("Оформить заказ", for: .normal)
        makeorderbutton.backgroundColor = .custom_green()
        
        self.addSubview(title)
        title.text = "Возможно вам понравиться"
        title.get_regular(size: 16)
        title.textColor = .custom_gray()
        title.snp.makeConstraints { (cons) in
            cons.top.equalTo(makeorderbutton.snp.bottom).offset(3)
            cons.left.right.equalTo(self).inset(15)
        }
        makeorderbutton.layer.cornerRadius = 4
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (cons) in
            cons.left.right.equalTo(self).inset(15)
            cons.bottom.equalTo(self).inset(15)
            cons.height.equalTo(225)
            cons.top.equalTo(title.snp.bottom).offset(0)
        }
        title.textColor = .custom_gray()
        collectionView.register(MayBeUlikeCollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        self.selectionStyle = .none
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
