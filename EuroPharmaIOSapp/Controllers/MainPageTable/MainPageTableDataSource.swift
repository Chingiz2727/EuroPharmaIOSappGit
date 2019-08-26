//
//  MainPageTableDataSource.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/1/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
extension MainPageTable:UITableViewDataSource,UICollectionViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MainPageIdentifiers().reuseIdentifier, for: indexPath) as? CategoryRowCell
            guard let tablecell = cell , let _ = ProductViewModel else {return UITableViewCell()}
            tablecell.titleLbl.text = Module.categoryModel[indexPath.row].title ?? ""
            tablecell.collectionView.tag = indexPath.row
            tablecell.collectionView.register(ItemCell.self, forCellWithReuseIdentifier: MainPageIdentifiers().itemReuseId)
            tablecell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
            tablecell.seeAllBtn.tag = indexPath.row
            
            tablecell.collectionView.reloadInputViews()
            tablecell.seeAllBtn.addTarget(self, action: #selector(goToList(sender:)), for: .touchUpInside)
            return tablecell

        }
        
        if indexPath.section == 2 {
            let foot = tableView.dequeueReusableCell(withIdentifier: MainPageIdentifiers().footerId) as! MainPageFooterTableViewCell
            return foot
        }
        return UITableViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageIdentifiers().itemReuseId, for: indexPath) as? ItemCell
        guard let collectionCell = cell,let ViewModule = ProductViewModel else {return UICollectionViewCell()}
        let cellViewModule = ViewModule.cellViewModule(forIndexPath: indexPath, section: collectionView.tag)
        collectionCell.layoutIfNeeded()
        collectionCell.layer.cornerRadius = 5
        collectionCell.viewModule = cellViewModule
        return collectionCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        if section == 1 {
            return ProductViewModel?.numOfRows() ?? 0
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
     
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var categoryLimit = Module.categoryModel[collectionView.tag].category_content.count
        if categoryLimit > 5 {
            categoryLimit = 5
        }
        return categoryLimit
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
}
