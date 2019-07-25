//
//  MyOrdersCollectionViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/19/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyOrdersCollectionViewController: UICollectionViewController {
    let columnLayout = ColumnFlowLayout(cellsPerRow: 1, cellheight: 120, minimumInteritemSpacing: 20, minimumLineSpacing: 35, sectionInset: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.collectionView!.register(MyOrdersCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.collectionViewLayout = columnLayout
        self.collectionView.collectionViewLayout = columnLayout
        columnLayout.collectionView?.backgroundColor = .custom_white()
        collectionView.bounces = false
        
        // Do any additional setup after loading the view.
    }
    
  

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    as? MyOrdersCollectionViewCell
        // Configure the cell
    
        return cell ?? UICollectionViewCell()
    }

}
