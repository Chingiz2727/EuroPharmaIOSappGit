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
  
    func removeAtItem(item: Int) {
        let catlist = CategoryListTableViewController()
        catlist.id = String(item)
        catlist.getData()
        self.navigationController?.pushViewController(catlist, animated: true)
    }
    
    
 var tableView: SelfSizedTableView = SelfSizedTableView()
    let reuseIdentifier = "categorycell"
    let itemReuseId = "itemCellReuseId"
    let newitemReuseId = "newitemCellReuseId"

    let categoryid = "catid"
    let data = SetupData()
    //Max number of items that can be viewed in horizontal category/item view
    let MAX_CATEGORIES = 99
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CategoryRowCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.register(MainPageCategoryRowCell.self, forCellReuseIdentifier: categoryid)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (cons) in
            cons.left.right.top.equalTo(self.view).inset(0)
            cons.bottom.equalTo(self.view).inset(0)
        }
        data.view = self
        DispatchQueue.main.async {
            self.data.setupFakeDemoData { [weak self] (error) in
                if error == false {
                    
                    self?.tableView.reloadData()
                }
            }
        }
      
        tableView.backgroundColor = .custom_white()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: categoryid) as! MainPageCategoryRowCell
         
            cell.select = self
            if let banner = data.banner {
                cell.category = data.categories ?? []
                cell.addlayer()
                cell.collectionView.reloadData() 
                for images in banner {
                    let url = images.image!
                    Alamofire.request(url).responseJSON { (response) in
                        if let data = response.data {
                            cell.carousel.slides.append(ZKCarouselSlide(image: UIImage.init(data: data)!, title: "", description: ""))
                        }
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
        return data.categoryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CategoryRowCell
        
        cell.collectionView.tag = indexPath.row
        cell.titleLbl.text = self.data.categoryItems[indexPath.row].title
        //Register Xibs
        cell.collectionView.register(ItemCell.self, forCellWithReuseIdentifier: itemReuseId)
        cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        
        
      
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        return data.categoryItems[collectionView.tag].category_content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemReuseId, for: indexPath) as! ItemCell
        let item = data.categoryItems[collectionView.tag].category_content[indexPath.row]
        cell.item = item
        let results = try! Realm().objects(FavouritesModule.self)
        for i in results {
            if i.id == item.id {
                cell.like_button.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            }
        }
        cell.mediaPoster.loadImageWithUrl(URL(string: data.categoryItems[collectionView.tag].category_content[indexPath.row].img_url ?? "")!)
        
       return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let it = data.categoryItems[collectionView.tag].category_content[indexPath.row]
        let detail = MedicineDetailViewController()
        detail.detail(id: String(it.id ?? 0))
        self.navigationController?.pushViewController(detail, animated: true)
        
    }
    
    

    
}

