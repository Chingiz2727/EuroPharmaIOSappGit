//
//  OrderStatusViewController.swift
//  EuroPharmaIOSapp
//
//  Created by Shyngys Kuandyk on 8/12/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import UIKit

class OrderStatusViewController: UIViewController {
    var orderView : OrderStatView {return self.view as! OrderStatView}
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func loadView() {
        super.loadView()
        self.view = OrderStatView(frame: self.view.bounds)
    }


}
