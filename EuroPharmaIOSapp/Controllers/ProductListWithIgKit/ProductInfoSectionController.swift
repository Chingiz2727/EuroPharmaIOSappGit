//
//  ProductInfoSectionController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/7/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import IGListKit

class ProductInfoSectionController: ListSectionController {
    var ProductViewModel:ProductViewModuleType?

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        
        guard let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: "cellid", for: self, at: index) as? ProductListCollectionViewCell else {fatalError()}
        
//        cell.viewModule = ProductViewModel?.cellViewModule(forIndexPath: [0,index], section: 0)
        return cell
    }
    override func numberOfItems() -> Int {
        return 2
    }
    override func didUpdate(to object: Any) {
        self.ProductViewModel = object as? ProductViewModuleType
    }
}
