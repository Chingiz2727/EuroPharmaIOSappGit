//
//  NavigationRouter.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 7/30/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
import UIKit
protocol Coordinator {
    
    
    var childCoordinators: [Coordinator] { get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}

protocol TabBarNavigator:class {
    var rootViewController: UIViewController {get}
}
