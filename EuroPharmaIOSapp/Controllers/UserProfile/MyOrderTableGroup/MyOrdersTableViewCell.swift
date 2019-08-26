//
//  MyOrdersTableViewCell.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class MyOrdersTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! ImagesCollectionViewCell
        cell.layoutIfNeeded()
        cell.layer.borderColor = UIColor.custom_gray().cgColor
        cell.layer.borderWidth = 0.5
        cell.images.image = #imageLiteral(resourceName: "ab1768591e4ab2a9776dd743a1e4ec99")
        return cell
    }
    
    let cellid = "cellid"
    let number = UILabel()
    let status = UILabel()
    let sum = UILabel()
    lazy var stack = UIStackView()
    let columnLayout = ColumnFlowLayout(cellsPerRow: 1, cellheight: 43, cellwidth: 33, minimumInteritemSpacing: 5, minimumLineSpacing: 5, sectionInset: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5))
    
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
        columnLayout.scrollDirection = .horizontal
        addSubViews(withList: [stack])
        stack.customStack(view: [number,status,sum,collectionView], distribution: .fill, spacing: 5)
        stack.axis = .vertical
        number.text = "№ 1253460210"
        status.text = "оставлен 16 августа 2019"
        sum.text = "Сумма 5540 ₸"
        number.get_bold(size: 18)
        number.textColor = .custom_gray()
        status.get_regular(size: 16)
        status.textColor = .custom_green()
        sum.get_regular(size: 16)
        sum.textColor = .custom_gray()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImagesCollectionViewCell.self, forCellWithReuseIdentifier: cellid)
        stack.snp.makeConstraints { (cons) in
            cons.left.right.bottom.top.equalToSuperview().inset(15)
        }
        collectionView.snp.makeConstraints { (cons) in
            cons.height.equalTo(50)
        }
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
