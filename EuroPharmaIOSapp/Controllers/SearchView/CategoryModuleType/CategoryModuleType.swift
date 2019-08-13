//
//  CategoryModuleType.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/2/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
protocol CategoryModuleType {
    func numofRows()->Int
    func cellViewModuleForIndexPath(indexpath:IndexPath) -> CategoryCellModuleType
    func selectrowAtIndexPath(indexpath:IndexPath)
}
