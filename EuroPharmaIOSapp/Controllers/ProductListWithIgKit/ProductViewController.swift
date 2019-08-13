//
//  ProductViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/7/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import IGListKit
class ProductViewController: UIViewController {
    
    var columnLayout2 = ColumnFlowLayout(cellsPerRow: 2, cellheight: 260, cellwidth: 0, minimumInteritemSpacing: 1, minimumLineSpacing: 0.3, sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    var objects: [ListDiffable] = [ListDiffable]()

    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: columnLayout2)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.bounces = false
        collection.isScrollEnabled = true
        collection.backgroundColor = .clear
        collection.collectionViewLayout = columnLayout2
        collection.allowsSelection = true
        return collection
    }()
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        return adapter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        adapter.collectionView = collectionView
        adapter.dataSource = self
        collectionView.backgroundColor = .white
//        collectionView.register(ProductListCollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = self.view.bounds
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ProductViewController:ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ProductInfoSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
         return nil
    }
    
    
}
