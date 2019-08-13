//
//  TestViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/7/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit
import CollectionKit

class TestViewController: UIViewController {
    let collection = CollectionView()
    let columLayout = ColumnFlowLayout(cellsPerRow: 2, cellheight: 120, cellwidth: 0, minimumInteritemSpacing: 3, minimumLineSpacing: 3, sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    
    let dataSource = ArrayDataSource(data:[ProductElement]())
    override func viewDidLoad() {
        super.viewDidLoad()

        updatecollection()
    }
    

    var networkManager: NetworkManager!
    
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
    }
    
    
    required  init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updatecollection() {
        
        self.view.addSubview(collection)
        collection.frame = self.view.bounds
        let viewSource = ClosureViewSource { (view:ProductListCollectionViewCell, data:ProductElement, index:Int) in
            
        }
        
        let provider = BasicProvider(dataSource: dataSource, viewSource: viewSource)
        collection.provider = provider
        
        provider.layout = FlowLayout(lineSpacing: 2, interitemSpacing: 2, justifyContent: .center, alignItems: .start, alignContent: .spaceAround)
        provider.layout = FlowLayout(spacing: 5, justifyContent: .start, alignItems: .start, alignContent: .center)
        network()
        
    }
    
    func network() {
        networkManager.getShopList { (product, error) in
            guard let prod = product?.products else {return}
            self.dataSource.data = prod
            DispatchQueue.main.async {
                self.dataSource.reloadData()

            }
        }
    }

}
