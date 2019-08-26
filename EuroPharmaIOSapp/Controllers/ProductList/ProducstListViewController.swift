//
//  ProducstListViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/29/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SKActivityIndicatorView
class ProducstListViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,DismissAndGo,UISearchControllerDelegate,UISearchBarDelegate {
    var content = SearchContentView()
    var update : updateSearchTable?
    
    var ProductViewModel:ProductViewModuleType?
    var Module = MainPageProductViewModule()
    var navigator : MainPageTableNavigator?
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.navigationBar.isTranslucent = false
        ProdList.collectionView.delegate = self
        ProdList.collectionView.dataSource = self
        addNavBarImage()
        
        ProdList.collectionView.register(ProductListCollectionViewCell.self, forCellWithReuseIdentifier: MainPageIdentifiers().itemReuseId)
        ProdList.collectionView.register(ProdListTwoCollectionViewCell.self, forCellWithReuseIdentifier: MainPageIdentifiers().newitemReuseId)
        ProductViewModel = Module
        Module.categoryModel = item
        
//        self.view.backgroundColor = .white()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let module = ProductViewModel , let navigat = navigator else {return}
      
        navigat.detail(module: module.SingleselectRow(atindexPath: indexPath)?.description.id ?? 0, title: module.SingleselectRow(atindexPath: indexPath)?.description.title ?? "")
    }
  
    

    override func loadView() {
        super.loadView()
        self.view = ProductListView(frame: self.view.bounds)
    }
    
    func DissMissAndGo(id: Int, title: String) {
        content.removeFromSuperview()
        addNavBarImage()
        navigator?.detail(module: id, title: title)
    }
    
    
    
    func addNavBarImage() {
        let sc = UISearchController(searchResultsController: nil)
        sc.delegate = self
        let scb = sc.searchBar
        sc.searchBar.delegate = self
        sc.definesPresentationContext = true
        definesPresentationContext = true
        scb.tintColor = UIColor.white
        scb.barTintColor = UIColor.white
        
        scb.placeholder = "Поиск по каталогу"
        navigationItem.title = "Каталог"
        if let textfield = scb.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.blue
            if let backgroundview = textfield.subviews.first {
                
                // Background color
                backgroundview.backgroundColor = UIColor.white
                
                // Rounded corner
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
                
            }
        }
        
        if let navigationbar = self.navigationController?.navigationBar {
            navigationbar.barTintColor = .custom_gray()
        }
        navigationItem.searchController = sc
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        content.removeFromSuperview()
        searchBar.endEditing(true)
    }
    
    
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.view.addSubview(content)
        content.snp.makeConstraints { (cons) in
            cons.width.height.equalTo(self.view)
        }
        
        return true
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        content.removeFromSuperview()
    }
    
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        update = content
        content.dismissgo = self
        update?.update(text: searchText)
        
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
        SKActivityIndicator.show()
        
        let view_white = UIView()
        self.view.addSubview(view_white)
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
    
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    
}
