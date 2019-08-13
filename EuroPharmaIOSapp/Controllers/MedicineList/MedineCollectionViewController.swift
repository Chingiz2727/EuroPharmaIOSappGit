//
//  MedineCollectionViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/17/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MedineCollectionViewController: UICollectionViewController {
    let columnLayout = ColumnFlowLayout(cellsPerRow: 1, cellheight: 180, minimumInteritemSpacing: 20, minimumLineSpacing: 25, sectionInset: UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15))
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.collectionView!.register(MedicineCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.collectionViewLayout = columnLayout
        self.collectionView.collectionViewLayout = columnLayout
        columnLayout.collectionView?.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        collectionView.bounces = false
        // Do any additional setup after loading the view.
    }


    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.navigationController?.pushViewController(MedicineDetailViewController(), animated: true)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MedicineCollectionViewCell
    
    
        return cell
    }

    
}
