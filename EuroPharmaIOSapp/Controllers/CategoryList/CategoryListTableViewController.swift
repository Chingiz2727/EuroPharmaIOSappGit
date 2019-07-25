//
//  CategoryListTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/17/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class CategoryListTableViewController: UICollectionViewController {
    var id : String = ""
    var cat = [Category]()
    let cellid = "cellid"
    let columnLayout = ColumnFlowLayout(cellsPerRow: 1, cellheight: 80, minimumInteritemSpacing: 20, minimumLineSpacing: 35, sectionInset: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(CategoryListTableViewCell.self, forCellWithReuseIdentifier: cellid)
       
        collectionView?.collectionViewLayout = columnLayout
        self.collectionView.collectionViewLayout = columnLayout
        columnLayout.collectionView?.backgroundColor = .white
        collectionView.bounces = false
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        let medicine = MedineCollectionViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(medicine, animated: true)
    }
 
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cat.count
    }
    
    
  
    
  
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
            as? CategoryListTableViewCell
        cell?.name.text = cat[indexPath.item].name ?? ""
        cell?.layoutIfNeeded()
        cell?.dropShadow(color: .custom_gray(), opacity: 0.3, offSet: CGSize(width: 3, height: 1), radius: 10, scale: false)
        return cell ?? UICollectionViewCell()
    }
    
    
   
    
    func getData() {
        Networking.Request(type: Product.self, params: nil, header: nil, url: Endpoint.main_url.rawValue + Endpoint.categories.rawValue + id, method: .get) { [weak self] (data, success, error) in
            if success == true {
                if let info = data?.categories {
                    self?.cat = info
                    self?.collectionView.reloadData()
                }
            }
        }
      
    }
    
  
}
