//
//  ViewController.swift
//  tableview_with_colletionview
//
//  Created by Robert Hills on 04/03/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit
import Alamofire
import ZKCarousel
import RealmSwift
class MainPageTable: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,RemoveAtCell {

    var networkManager: NetworkManager!
    
    func removeAtItem(item: Int) {
        let catlist = CategoryListTableViewController()
        catlist.id = String(item)
        catlist.getData()
        self.navigationController?.pushViewController(catlist, animated: true)
    }
    
    
var ProductViewModel:ProductViewModuleType?
var Module = MainPageProductViewModule()
    var navigator : MainPageTableNavigator?
    
 var tableView: SelfSizedTableView = {
    let table = SelfSizedTableView()
    table.register(CategoryRowCell.self, forCellReuseIdentifier: MainPageIdentifiers().reuseIdentifier)
    table.register(MainPageCategoryRowCell.self, forCellReuseIdentifier: MainPageIdentifiers().categoryid)
    table.backgroundColor = .custom_white()
    return table
    }()



    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (cons) in
            cons.left.right.top.equalTo(self.view).inset(0)
            cons.bottom.equalTo(self.view).inset(0)
        }
        DispatchQueue.main.async {
                self.SetupData()

        }
        navigator = MainPageTableNavigator(navigationController: self.navigationController!)

        ProductViewModel = Module
        
    }
    

    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
           
            let cell = tableView.dequeueReusableCell(withIdentifier: MainPageIdentifiers().categoryid) as! MainPageCategoryRowCell
            if Module.banner.count != 0 {
                cell.titleLbl.text = "Акции"
            }
            
            cell.select = self
            cell.category = Module.categories
            cell.banner = Module.banner
                cell.addlayer()
                cell.collectionView.reloadData() 
                for images in Module.banner {
                    let url = images.image!
                    Alamofire.request(url).responseJSON { (response) in
                        if let data = response.data {
                            cell.carousel.slides.append(ZKCarouselSlide(image: UIImage.init(data: data)!, title: "", description: ""))
                        }
                    }
                }
            
            return cell
        }
      return UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        return ProductViewModel?.numOfRows() ?? 0
    }
    
    @objc func goToList(sender:UIButton) {
        navigator?.list(item: Module.categoryModel[sender.tag].category_content)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            var categoryLimit = Module.categoryModel[collectionView.tag].category_content.count
            if categoryLimit > 5 {
                categoryLimit = 5
            }
            return categoryLimit
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 0)
    }
   
    
    
//    ProductCollectionViewCell
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageIdentifiers().itemReuseId, for: indexPath) as? ItemCell
        guard let collectionCell = cell,let ViewModule = ProductViewModel else {return UICollectionViewCell()}
        let cellViewModule = ViewModule.cellViewModule(forIndexPath: indexPath, section: collectionView.tag)
        collectionCell.viewModule = cellViewModule
        collectionCell.layoutIfNeeded()
        collectionCell.check()
       return collectionCell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let module = ProductViewModel else {return}
        module.selectRow(atindexPath: indexPath, atSection: collectionView.tag)
        navigator?.detail(module: module.viewModuleForSelectedRow()!)
        
    }
    
     init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
    }
    
    
    required  init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

