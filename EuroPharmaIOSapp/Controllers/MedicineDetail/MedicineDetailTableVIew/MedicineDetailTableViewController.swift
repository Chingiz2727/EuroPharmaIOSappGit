//
//  MedicineDetailTableViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/9/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import SKActivityIndicatorView
class MedicineDetailTableViewController: UITableViewController {
    var product : ProductElement?
  var sections = [Section(content: "Характеристики", item: ["Item1","Item2","Item3","Item4"]),Section(content: "Описание", item: ["View1","View2","View3","View4"])]
    var viewModule: DetailViewModelType?
    var id : Int?
    var networkManager: NetworkManager!
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MedicineDetailHeaderTableViewCell.self, forCellReuseIdentifier: MainPageIdentifiers().searchHeader)
        tableView.register(MedicineTableViewCell.self, forCellReuseIdentifier: MainPageIdentifiers().reuseIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: MainPageIdentifiers().newitemReuseId)
        switch traitCollection.userInterfaceStyle {
        case .dark:
            self.view.backgroundColor = .custom_gray()
            self.tableView.backgroundColor = .custom_gray()
            self.tableView.tableFooterView?.backgroundColor = .custom_gray()
        default:
            break
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateData()

    }
    
    func updateData() {
        let view_white = UIView()
        self.view.addSubview(view_white)
        view_white.backgroundColor = .white
        view_white.frame = self.view.bounds
        SKActivityIndicator.show("Загрузка", userInteractionStatus: true)
        DispatchQueue.global().async {
            self.networkManager.getProductDetail(id:self.id ?? 0) { (element, error) in
                guard let elem = element else {return}
                self.product = elem
                
//                self.navigationController?.title = elem.name ?? ""
                DispatchQueue.main.async {
                    self.navigationItem.title = elem.name

                    view_white.removeFromSuperview()
                    self.tableView.reloadData()
                }
            }
        }
        SKActivityIndicator.dismiss()
    }

    
}
