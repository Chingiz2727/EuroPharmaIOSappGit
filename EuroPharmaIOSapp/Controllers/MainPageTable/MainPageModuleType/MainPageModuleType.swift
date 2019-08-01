//
//  MainPageModuleType.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/26/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
protocol ProductViewModuleType {
    func numOfRows() -> Int
    
    func cellViewModule(forIndexPath indexPath:IndexPath,section:Int) -> ProductViewCellModuleType?
    func viewModuleForSelectedRow() -> DetailViewModelType?
    func selectRow(atindexPath indexPath:IndexPath,atSection section:Int)
    func cellSingleViewModule(forindexPath indexPath:IndexPath) -> ProductViewCellModuleType?
    func SingleselectRow(atindexPath indexPath:IndexPath)  -> DetailViewModelType? 

}



