//
//  ProducstListViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/29/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SKActivityIndicatorView
class ProducstListViewController: SearchViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var ProductViewModel:ProductViewModuleType?
    var Module = MainPageProductViewModule()
    var item = [CategoryContentModel]()
    var id : Int? = 0
    var ProdList : ProductListView  {return self.view as! ProductListView}
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return ProductViewModel?.numOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = content_type.get_content_type()
        switch type {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageIdentifiers().itemReuseId, for: indexPath) as? ProductListCollectionViewCell
            
            guard let collectionCell = cell,let ViewModule = ProductViewModel else {return UICollectionViewCell()}
            let cellViewModule = ViewModule.cellSingleViewModule(forindexPath: indexPath)
            collectionCell.viewModule = cellViewModule
            collectionCell.layoutIfNeeded()
            return collectionCell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageIdentifiers().newitemReuseId, for: indexPath) as? ProdListTwoCollectionViewCell
            guard let collectionCell = cell,let ViewModule = ProductViewModel else {return UICollectionViewCell()}
            let cellViewModule = ViewModule.cellSingleViewModule(forindexPath: indexPath)

            collectionCell.viewModule = cellViewModule
            collectionCell.layoutIfNeeded()
            return collectionCell
        }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ProdList.collectionView.delegate = self
        ProdList.collectionView.dataSource = self
        
        ProdList.collectionView.register(ProductListCollectionViewCell.self, forCellWithReuseIdentifier: MainPageIdentifiers().itemReuseId)
        ProdList.collectionView.register(ProdListTwoCollectionViewCell.self, forCellWithReuseIdentifier: MainPageIdentifiers().newitemReuseId)
        ProductViewModel = Module
        Module.categoryModel = item
    }
  
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let module = ProductViewModel , let navigat = navigator else {return}
      
        navigat.detail(module: module.SingleselectRow(atindexPath: indexPath)?.description.id ?? 0, title: module.SingleselectRow(atindexPath: indexPath)?.description.title ?? "")
    }
  
    

    override func loadView() {
        super.loadView()
        self.view = ProductListView(frame: self.view.bounds)
    }
    

    
    
    
  
    var networking : NetworkManager!
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networking = networkManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getData() {
        
        let view_white = UIView()
        self.view.addSubview(view_white)
        SKActivityIndicator.show()

        view_white.backgroundColor = .white
        view_white.frame = self.view.bounds
        networking.getCatalog(id: id ?? 0) { (product, error) in
            print(error)
            guard let product = product else {
                SKActivityIndicator.dismiss()
                CustomAlert.customAlert.showalert(controller: self, text: "Ошибка", message: error)
                return}
            var module = CategoryContentModel()
            var content = [CategoryContentModel]()
            for item in product {
                let cell = CategoryContentModel()
                cell.category = item.category
                cell.id = item.id
                cell.title = item.name
                cell.img_url = item.img
                cell.menufacturer = item.manufacturer
                cell.new_price = item.price
                cell.old_price = item.priceOriginal
                content.append(cell)
            }
            module.category_content = content
            self.Module.categoryModel = content
            DispatchQueue.main.async {
                self.ProdList.collectionView.reloadData()
                SKActivityIndicator.dismiss()
                view_white.removeFromSuperview()
            }
        }
    }
    
    
   
    
}
