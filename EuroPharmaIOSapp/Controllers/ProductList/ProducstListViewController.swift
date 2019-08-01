//
//  ProducstListViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/29/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class ProducstListViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var ProductViewModel:ProductViewModuleType?
    var Module = MainPageProductViewModule()
    var navigator : MainPageTableNavigator?
    var item = [CategoryContentModel]()
    
    var ProdList : ProductListView  {return self.view as! ProductListView}
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return ProductViewModel?.numOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageIdentifiers().itemReuseId, for: indexPath) as? ItemCell
        
        guard let collectionCell = cell,let ViewModule = ProductViewModel else {return UICollectionViewCell()}
        let cellViewModule = ViewModule.cellSingleViewModule(forindexPath: indexPath)
        collectionCell.viewModule = cellViewModule
        collectionCell.setupViews()
        cell?.check()
        return collectionCell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ProdList.collectionView.delegate = self
        ProdList.collectionView.dataSource = self
        ProdList.collectionView.register(ItemCell.self, forCellWithReuseIdentifier: MainPageIdentifiers().itemReuseId)
        ProductViewModel = Module
        Module.categoryModel = item
        self.view.backgroundColor = .custom_white()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let module = ProductViewModel , let navigat = navigator else {return}
        navigat.detail(module: module.SingleselectRow(atindexPath: indexPath)!)
    }
    

    override func loadView() {
        super.loadView()
        self.view = ProductListView(frame: self.view.bounds)
    }
}
