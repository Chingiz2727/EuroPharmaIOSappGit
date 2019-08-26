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
import InstantSearchClient
import InstantSearch

class MainPageTable: UIViewController, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,RemoveAtCell {
    var content = SearchContentView()
    var update : updateSearchTable?

    
    var networkManager: NetworkManager!
    
    func removeAtItem(item: Int) {
        navigator?.go_fromCategory(id: item)
    }
    
    
var ProductViewModel:ProductViewModuleType?
var Module = MainPageProductViewModule()
    var navigator : MainPageTableNavigator?
    
 var tableView: SelfSizedTableView = {
    let table = SelfSizedTableView()
    table.register(CategoryRowCell.self, forCellReuseIdentifier: MainPageIdentifiers().reuseIdentifier)
    table.register(MainPageCategoryRowCell.self, forCellReuseIdentifier: MainPageIdentifiers().categoryid)
    table.backgroundColor = .custom_white()
    table.register(MainPageFooterTableViewCell.self, forCellReuseIdentifier: MainPageIdentifiers().footerId)
    table.tableHeaderView?.backgroundColor = .custom_white()
    table.tableFooterView?.backgroundColor = .custom_white()
    table.separatorStyle = .none
    table.keyboardDismissMode = .onDrag
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
        self.SetupData()
        navigator = MainPageTableNavigator(navigationController: self.navigationController!)
        navigator?.navigationController.navigationBar.barTintColor = .custom_gray()
        addNavBarImage()
        ProductViewModel = Module
    }
    
 
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      
        
        if section == 0 {
           
            let cell = tableView.dequeueReusableCell(withIdentifier: MainPageIdentifiers().categoryid) as! MainPageCategoryRowCell
            if Module.banner.count != 0 {
                cell.titleLbl.text = "Категории"
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
      return nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
   
    
    @objc func goToList(sender:UIButton) {
        navigator?.list(item: Module.categoryModel[sender.tag].category_content)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
   
    
    
//    ProductCollectionViewCell
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let module = ProductViewModel else {return}
        module.selectRow(atindexPath: indexPath, atSection: collectionView.tag)
        navigator?.detail(module: module.viewModuleForSelectedRow()?.description.id ?? 0, title: module.viewModuleForSelectedRow()?.description.title ?? "")
        
    }
    
     init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
    }

    
    required  init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

